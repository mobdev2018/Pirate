//
//  SuggestionVC.m
//  Pirate
//
//  Created by aaa on 4/24/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "SuggestionVC.h"
#import "SuggestionCell.h"
#import "OtherProfileVC.h"

#import "WebServiceManager.h"
#import "MBProgressHUD.h"


@interface SuggestionVC ()
{
    CGSize screenSize;
    NSMutableArray *arrData;
    int totalCount;
    int per_page;
    int fromRow, toRow;
    int current_page, last_page;
    NSString *strNextPageUrl;
    NSString *strPrevPageUrl;
    
}
@end

@implementation SuggestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenSize = [UIScreen mainScreen].bounds.size;
    
    // init variables
    arrData = [[NSMutableArray alloc] init];
    per_page = 5;
    totalCount = 0;
    fromRow = toRow = 1;
    current_page = last_page = 1;
    
    [self.tableView addHeaderWithTarget:self action:@selector(refreshHeader)];
    [self.tableView addFooterWithTarget:self action:@selector(refreshFooter)];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *strUrl = @"connection/suggestions";
    [[WebServiceManager sharedInstance] getConnectionSuggestions:strUrl completionHander:^(id obj) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSLog(@"suggestions: %@", dicResponse);
        
        current_page = [[dicResponse valueForKey:@"current_page"] intValue];
        last_page = [[dicResponse valueForKey:@"last_page"] intValue];
        per_page = [[dicResponse valueForKey:@"per_page"] intValue];
        fromRow = [[dicResponse valueForKey:@"from"] intValue];
        toRow = [[dicResponse valueForKey:@"to"] intValue];
        totalCount = [[dicResponse valueForKey:@"total"] intValue];
        strPrevPageUrl = [dicResponse valueForKey:@"prev_page_url"];
        strNextPageUrl = [dicResponse valueForKey:@"next_page_url"];
        
        NSArray *data = [dicResponse valueForKey:@"data"];
        arrData = [data mutableCopy];
        
        [self.tableView reloadData];
        
        
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

#pragma mark - DXRefresh delegate
- (void)refreshHeader
{
    [self.tableView headerEndRefreshing];
}

- (void)refreshFooter
{
    NSNull *null = [[NSNull alloc] init];
    if ([strNextPageUrl isEqual:null]) {
        [self.tableView footerEndRefreshing];
        return;
    }
    NSString *strBaseUrl = @"http://developer.rabieb.dd-c.com/api/v1/";
    NSString *strUrl = [strNextPageUrl substringFromIndex:strBaseUrl.length];
    [[WebServiceManager sharedInstance] getConnectionSuggestions:strUrl completionHander:^(id obj) {
        
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSLog(@"suggestions: %@", dicResponse);
        
        current_page = [[dicResponse valueForKey:@"current_page"] intValue];
        last_page = [[dicResponse valueForKey:@"last_page"] intValue];
        per_page = [[dicResponse valueForKey:@"per_page"] intValue];
        fromRow = [[dicResponse valueForKey:@"from"] intValue];
        toRow = [[dicResponse valueForKey:@"to"] intValue];
        totalCount = [[dicResponse valueForKey:@"total"] intValue];
        strPrevPageUrl = [dicResponse valueForKey:@"prev_page_url"];
        strNextPageUrl = [dicResponse valueForKey:@"next_page_url"];
        
        NSArray *data = [dicResponse valueForKey:@"data"];
        [arrData addObjectsFromArray:data];
        
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
        
    } errorHandler:^(NSError *error) {
        NSLog(@"%@", error);
        
        [self showDefaultAlert:@"Failed" message:@"Connection Failed."];
    }];

}

- (void)handStartHeaderRefresh
{
    [self.tableView headerBeginRefreshing];
    [self refreshHeader];
}


#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float tableCellHeight = 352 * screenSize.height / 1920.0f;
    return tableCellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuggestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuggestionCellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    NSDictionary *data = arrData[row];
    
    NSString *strName = [NSString stringWithFormat:@"%@ %@", [data valueForKey:@"fname"], [data valueForKey:@"lname"]];
    cell.lblName.text = strName;
    
    // set fonts and font size
    float nameLabelFontSize = 44 * screenSize.height / 1920.0f;
    [cell.lblName setFont:[UIFont systemFontOfSize:nameLabelFontSize]];
    
    float rateLabelFontSize = 44 * screenSize.height / 1920.0f;
    [cell.lblRating setFont:[UIFont systemFontOfSize:rateLabelFontSize]];
    
    float addFriendLabelFontSize = 36 * screenSize.height / 1920.0f;
    [cell.lblAddFriend setFont:[UIFont systemFontOfSize:addFriendLabelFontSize weight:0.3f]];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    cell.viewAddFriendButton.layer.borderColor = blueColor.CGColor;
    cell.viewAddFriendButton.layer.borderWidth = 1.0f;
    cell.viewAddFriendButton.layer.cornerRadius = 3.0f;
    
    
    //cell.mData = data;
    cell.btnAddFriend.tag = row;
    
    return cell;
}


#pragma mark - tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"OtherProfileViewSegueIdentifier"]) {
        NSInteger row = [self.tableView.indexPathForSelectedRow row];
        NSDictionary *userData = arrData[row];
        OtherProfileVC *vc = segue.destinationViewController;
        vc.dicData = userData;
    }   
    
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

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onAddFriend:(id)sender {
    UIButton *btnAddFriend = (UIButton*)sender;
    NSInteger row = btnAddFriend.tag;
    int user_id = [[arrData[row] valueForKey:@"id"] intValue];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[WebServiceManager sharedInstance] sendFriendRequestWithConnection:user_id completionHander:^(id obj) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSDictionary *dicResponse = (NSDictionary*)obj;
        [self showDefaultAlert:@"Successful" message:@"Sent Friend Request"];
        NSLog(@"send request : %@", dicResponse);
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@", error);
        [self showDefaultAlert:@"Failed" message:@"Send Friend Request Failed!"];
    }];
}
@end
