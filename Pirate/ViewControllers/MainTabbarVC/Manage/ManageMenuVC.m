//
//  ManageMenuVC.m
//  Pirate
//
//  Created by beauty on 5/4/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ManageMenuVC.h"
#import "ManageMenuCell.h"
#import "ManageProfileVC.h"
#import "InboxVC.h"
#import "ManageSettingsViewController.h"

#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "WebServiceManager.h"

@interface ManageMenuVC ()
{
    CGSize screenSize;
}
@end

@implementation ManageMenuVC
@synthesize arrIcons;
@synthesize arrMenuTitles;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenSize = [UIScreen mainScreen].bounds.size;
    
    arrIcons = @[@"manage_profile_icon.png", @"manage_notification_icon.png", @"manage_inbox_icon.png", @"manage_settings_icon.png"];
    
    arrMenuTitles = @[@"Profile", @"Notification", @"Inbox", @"Settings"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableview datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float rowHeight = 160 * screenSize.height / 1920.0f;
    return rowHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrMenuTitles.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManageMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ManageMenuCellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    cell.imgIcon.image = [UIImage imageNamed:arrIcons[row]];
    cell.lblTitle.text = arrMenuTitles[row];
    
    return cell;
}

#pragma mark - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    switch (row) {
        case 0: // profile
        {
            ManageProfileVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ManageProfileVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: // notfification
            break;
        case 2: // inbox
        {
            InboxVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InboxVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3: // settings
        {
            ManageSettingsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ManageSettingsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
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


#pragma mark - button events

- (IBAction)onTerms:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.pirate-app.com/"]];
}

- (IBAction)onLogout:(id)sender
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
        [self showDefaultAlert:@"Failed" message:@"Logout Failed."];
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


@end
