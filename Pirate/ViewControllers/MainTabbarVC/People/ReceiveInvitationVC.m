//
//  ReceiveInvitationVC.m
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ReceiveInvitationVC.h"
#import "ReceiveInvitationCell.h"

@interface ReceiveInvitationVC ()
{
    CGSize screenSize;
}
@end

@implementation ReceiveInvitationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenSize = [UIScreen mainScreen].bounds.size;
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 352 * screenSize.height / 1920.0f;
    return cellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReceiveInvitationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceiveInvitationCellIdentifier" forIndexPath:indexPath];
    
    float imageHeight = 254 * screenSize.height / 1920.0f;
    cell.imgProfile.layer.cornerRadius = imageHeight / 2.0f;
    
    float nameFontSize = 42 * screenSize.height / 1920.0f;
    [cell.lblName setFont:[UIFont systemFontOfSize:nameFontSize]];
    [cell.lblRate setFont:[UIFont systemFontOfSize:nameFontSize]];
    
    float acceptFriendshipFontSize = 36 * screenSize.height / 1920.0f;
    [cell.lblAcceptFriendship setFont:[UIFont systemFontOfSize:acceptFriendshipFontSize weight:0.3f]];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    cell.viewAcceptFriendship.layer.borderWidth = 1.0f;
    cell.viewAcceptFriendship.layer.borderColor = blueColor.CGColor;
    cell.viewAcceptFriendship.layer.cornerRadius = 3.0f;
    
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
@end
