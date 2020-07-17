//
//  ManageSettinsVC.m
//  Pirate
//
//  Created by beauty on 5/5/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ManageSettingsViewController.h"
#import "ManageSettingsCell.h"
#import "MBProgressHUD.h"
#import "WebServiceManager.h"
#import "UserInfo.h"
#import "AppDelegate.h"

@interface ManageSettingsViewController ()
{
    CGSize screenSize;
}
@end

@implementation ManageSettingsViewController
@synthesize arrSettingTitles;
@synthesize arrSettingStatus;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenSize = [UIScreen mainScreen].bounds.size;
    
    arrSettingTitles = @[@"Log out", @"Turn off notification", @"Disable profile", @"Block invitation"];
    arrSettingStatus = [@[@"off", @"off", @"on", @"off"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    float titleFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.3f]];
    
}

#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float rowHeight = 170 * screenSize.height / 1920.0f;
    return rowHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSettingTitles.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManageSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ManageSettingsCellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    cell.lblTitle.text = arrSettingTitles[row];
    cell.btnCheck.tag = row;
    if ([arrSettingStatus[row] isEqualToString:@"off"]) {
        [cell.btnCheck setImage:[UIImage imageNamed:@"manage_check_icon.png"] forState:UIControlStateNormal];
    } else {
        [cell.btnCheck setImage:[UIImage imageNamed:@"manage_checked_icon.png"] forState:UIControlStateNormal];
    }
    
    if (row == 0) {
        [cell.btnCheck setHidden:YES];
    }
    return cell;
}


#pragma mark - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (row == 0) {
        [self logout];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)logout
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebServiceManager sharedInstance] logout:^(id obj) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSString *strResponse = [dicResponse valueForKey:@"response"];
        if ([strResponse isEqualToString:@"Logged out"]) {
            NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
            [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
            
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            [appDelegate reset];
        }
        
    } errorHandler:^(NSError *error) {
        NSLog(@"%@", error);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Failed" message:@"Login Failed."];
    }];
        
}


#pragma mark - show default alert
-(void) showDefaultAlert:(NSString *)title message:(NSString*)message
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - button events
- (IBAction)onCheckButton:(id)sender {
    UIButton *checkButton = (UIButton*)sender;
    NSInteger row = checkButton.tag;
    
    if ([arrSettingStatus[row] isEqualToString:@"off"]) {
        [checkButton setImage:[UIImage imageNamed:@"manage_checked_icon.png"] forState:UIControlStateNormal];
        [arrSettingStatus replaceObjectAtIndex:row withObject:@"on"];
    } else {
        [checkButton setImage:[UIImage imageNamed:@"manage_check_icon.png"] forState:UIControlStateNormal];
        [arrSettingStatus replaceObjectAtIndex:row withObject:@"off"];
    }
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
