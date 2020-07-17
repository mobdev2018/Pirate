//
//  SuggestionVC.h
//  Pirate
//
//  Created by aaa on 4/24/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+DXRefresh.h"

@interface SuggestionVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)onBack:(id)sender;
- (IBAction)onAddFriend:(id)sender;
@end
