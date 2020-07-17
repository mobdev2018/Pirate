//
//  PeopleMainVC.m
//  Pirate
//
//  Created by beauty on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "PeopleMainVC.h"
#import "PeopleMainCell.h"
#import "PeopleRateVC.h"
#import "SuggestionVC.h"
#import "FriendsVC.h"
#import "ReceiveInvitationVC.h"
#import "InvitePeopleVC.h"
#import "AnalysisVC.h"

@interface PeopleMainVC ()
{
    CGSize screenSize;
}
@end

@implementation PeopleMainVC

@synthesize arrCategoryIcons;
@synthesize arrCategoryNames;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    arrCategoryIcons = @[@"rate_people_icon.png", @"friends_icon.png", @"suggestion_icon.png", @"invitation_sent_icon.png", @"invitation_receive_icon.png", @"rating_analysis_icon.png"];
    arrCategoryNames = @[@"Rate People", @"Friends", @"Suggestion", @"Invitation Sent", @"Invitation Receive", @"Rating Analysis"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    screenSize = [UIScreen mainScreen].bounds.size;
    
    float titleLabelFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:titleLabelFontSize weight:0.3f]];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 170 * screenSize.height / 1920.0f;
    return cellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrCategoryNames.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PeopleMainCellIdentifier" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    [cell.imgIcon setImage:[UIImage imageNamed:arrCategoryIcons[row]]];
    cell.lblTitle.text = arrCategoryNames[row];
    
    return cell;
}

#pragma mark - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    switch (row) {
        case 0: // Rate People
        {
            PeopleRateVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PeopleRateVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: // Friends
        {
            FriendsVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2: // Suggestion
        {
            SuggestionVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SuggestionVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3: // Invitation Sent
        {
            InvitePeopleVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InvitePeopleVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4: // Invitation Receive
        {
            ReceiveInvitationVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ReceiveInvitationVC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: // Rating Analysis
        {
            AnalysisVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AnalysisVC"];
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

@end
