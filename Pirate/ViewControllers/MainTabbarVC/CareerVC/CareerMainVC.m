//
//  CareerVC.m
//  Pirate
//
//  Created by beauty on 4/17/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "CareerMainVC.h"
#import "HiredCell.h"
#import "InvitedCell.h"
#import "ContactVC.h"
#import "UserInfo.h"

@interface CareerMainVC ()

@end

@implementation CareerMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserInfo *userInfo = [UserInfo standardUserInfo];
    NSString *strName = [NSString stringWithFormat:@"%@ %@", userInfo.fname, userInfo.lname];
    self.lblNavTitle.text = strName;
    
    self.arrNotifications = [[NSMutableArray alloc] init];

    [self initDemoDatas];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float fontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:fontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    float textFontSize = 40 * screenSize.height / 2018.0f;
    
    [self.lblYouHaveLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblCreditsLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblCreditsCount setFont:[UIFont systemFontOfSize:textFontSize weight:0.3f]];
    
    self.btnPostJob.layer.cornerRadius = 3.0f;
    self.btnSearchJob.layer.cornerRadius = 3.0f;
    
    if (self.arrNotifications.count == 0) {
        [self.tableView setHidden:YES];
    } else {
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
    }
    
    
}

-(void) initDemoDatas
{
    NSMutableDictionary *dicHiredModel = [[NSMutableDictionary alloc] init];
    [dicHiredModel setValue:[NSNumber numberWithInt:HIREDTYPE] forKey:@"Type"];
    [dicHiredModel setValue:@"Lorem ipsum dolor" forKey:@"JobTitle"];
    [self.arrNotifications addObject:dicHiredModel];
    
    
    for (int i = 0; i < 5; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[NSNumber numberWithInt:INVITEDTYPE] forKey:@"Type"];
        [dic setValue:@"Lorem ipsum dolor" forKey:@"JobTitle"];
        [self.arrNotifications addObject:dic];
    }    
}



- (IBAction)onSearch:(id)sender {
}


#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrNotifications.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float rowHeight = 160 * screenSize.height / 1920.0f;
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSMutableDictionary *dicNotification = self.arrNotifications[row];
    NotificationType type = (NotificationType)[[dicNotification valueForKey:@"Type"] intValue];
    NSString *strJobTitle = [dicNotification valueForKey:@"JobTitle"];
    switch (type) {
        case HIREDTYPE:
        {
            HiredCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HiredCellIdentifier" forIndexPath:indexPath];
            NSString *strContent = [NSString stringWithFormat:@"You hired by %@", strJobTitle];
            cell.lblContent.text = strContent;
            return cell;
        }
        case INVITEDTYPE:
        {
            InvitedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InvitedCellIdentifier" forIndexPath:indexPath];
            NSString *strContent = [NSString stringWithFormat:@"You invited to apply job %@", strJobTitle];
            cell.lblContent.text = strContent;
            return cell;
        }
        default:
            break;
    }
    
    return nil;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = [segue identifier];
    if ([segueId isEqualToString:@"ApplyJobSegue"]) {
        ContactVC *contactVC = [segue destinationViewController];
        contactVC.m_statusType = Invited;
    }
}

@end
