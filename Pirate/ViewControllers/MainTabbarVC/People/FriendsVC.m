//
//  FriendsVC.m
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "FriendsVC.h"
#import "FriendsCell.h"

#import "MBProgressHUD.h"
#import "WebServiceManager.h"

@interface FriendsVC ()
{
    CGSize screenSize;
}

@end

@implementation FriendsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenSize = [UIScreen mainScreen].bounds.size;
    
    int user_id = [[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"] intValue];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary *dicParams = @{@"limit":@5, @"status": @"approved"};
    [[WebServiceManager sharedInstance] getFriends:user_id parameters:dicParams completionHandler:^(id obj) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSDictionary *dicResponse = (NSDictionary*)obj;
        /*
        NSString *strResponse = [dicResponse valueForKey:@"response"];
        NSString *strStatusCode = [dicResponse valueForKey:@"status_code"];
        NSArray *arrDatas = [dicResponse valueForKey:@"data"];
        */
        NSLog(@"Friends : %@", dicResponse);
        
    } errorHandler:^(NSError *error) {
        NSLog(@"%@", error);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Failed" message:@"Connection Failed."];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    float navTitleFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:navTitleFontSize weight:0.3f]];
    
}

#pragma mark - tableview datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 206 * screenSize.height / 1920.0f;
    return cellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendsCellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    
    float imageHeight = 128 * screenSize.height / 1920.0f;
    cell.imgProfile.layer.cornerRadius = imageHeight / 2.0f;
    
    float labelFontSize = 36 * screenSize.height / 1920.0f;
    [cell.lblName setFont:[UIFont systemFontOfSize:labelFontSize]];
    [cell.lblRate setFont:[UIFont systemFontOfSize:labelFontSize]];
    
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
