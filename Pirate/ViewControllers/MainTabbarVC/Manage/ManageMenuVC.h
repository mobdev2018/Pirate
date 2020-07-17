//
//  ManageMenuVC.h
//  Pirate
//
//  Created by beauty on 5/4/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageMenuVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrIcons;
@property (strong, nonatomic) NSArray *arrMenuTitles;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)onTerms:(id)sender;
- (IBAction)onLogout:(id)sender;

@end
