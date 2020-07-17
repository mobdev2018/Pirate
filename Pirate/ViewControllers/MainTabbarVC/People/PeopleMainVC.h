//
//  PeopleMainVC.h
//  Pirate
//
//  Created by beauty on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleMainVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arrCategoryIcons;
@property (nonatomic, strong) NSArray *arrCategoryNames;

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
