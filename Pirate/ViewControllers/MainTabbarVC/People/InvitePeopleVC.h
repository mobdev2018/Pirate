//
//  InvitePeopleVC.h
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvitePeopleVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)onClick:(id)sender;

@end
