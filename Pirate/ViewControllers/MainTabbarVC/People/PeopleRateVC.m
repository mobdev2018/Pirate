//
//  PeopleRateVC.m
//  Pirate
//
//  Created by beauty on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "PeopleRateVC.h"
#import "PeopleRateCell.h"
#import "UserInfo.h"

@interface PeopleRateVC ()
{
    CGSize screenSize;
}
@end

@implementation PeopleRateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserInfo *userInfo = [UserInfo standardUserInfo];
    NSString *strName = [NSString stringWithFormat:@"%@ %@", userInfo.fname, userInfo.lname];
    self.lblNavTitle.text = strName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    screenSize = [UIScreen mainScreen].bounds.size;
    
    float titleFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.3f]];
    
}

#pragma mark - tableview data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 450 * screenSize.height / 1920.0f;
    return cellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleRateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PeopleRateCellIdentifier" forIndexPath:indexPath];
    
    float nameLabelFontSize = 42 * screenSize.height / 1920.0f;
    [cell.lblName setFont:[UIFont systemFontOfSize:nameLabelFontSize]];
    
    float commentLabelFontSize = 36 * screenSize.height / 1920.0f;
    [cell.lblComment setFont:[UIFont systemFontOfSize:commentLabelFontSize]];
    [cell.lblRate setFont:[UIFont systemFontOfSize:commentLabelFontSize]];
    
    float submitButtonFontSize = 36 * screenSize.height / 1920.0f;
    [cell.btnSubmitRate.titleLabel setFont:[UIFont systemFontOfSize:submitButtonFontSize weight:0.3f]];
    cell.btnSubmitRate.layer.cornerRadius = 3.0f;
    
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


#pragma mark - button events

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
