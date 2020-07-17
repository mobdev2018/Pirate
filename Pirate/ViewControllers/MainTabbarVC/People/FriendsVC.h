//
//  FriendsVC.h
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)onBack:(id)sender;

@end
