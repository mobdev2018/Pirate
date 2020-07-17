//
//  ManageSettinsVC.h
//  Pirate
//
//  Created by beauty on 5/5/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrSettingTitles;
@property (strong, nonatomic) NSMutableArray *arrSettingStatus;

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)onBack:(id)sender;

@end
