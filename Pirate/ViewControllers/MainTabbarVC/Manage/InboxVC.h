//
//  InboxVC.h
//  Pirate
//
//  Created by beauty on 5/4/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)onBack:(id)sender;
- (IBAction)onSearch:(id)sender;


@end
