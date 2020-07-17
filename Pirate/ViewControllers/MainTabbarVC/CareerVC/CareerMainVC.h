//
//  CareerVC.h
//  Pirate
//
//  Created by beauty on 4/17/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum notifictaion_type{
    HIREDTYPE,
    INVITEDTYPE,
}NotificationType;

@interface CareerMainVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *arrNotifications;

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;

@property (strong, nonatomic) IBOutlet UILabel *lblYouHaveLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblCreditsCount;
@property (strong, nonatomic) IBOutlet UILabel *lblCreditsLabel;

@property (strong, nonatomic) IBOutlet UIButton *btnPostJob;
@property (strong, nonatomic) IBOutlet UIButton *btnSearchJob;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)onSearch:(id)sender;

@end
