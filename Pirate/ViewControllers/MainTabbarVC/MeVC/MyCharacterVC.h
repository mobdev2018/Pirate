//
//  MyCharacterVC.h
//  Pirate
//
//  Created by beauty on 3/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCharacterVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSArray *arrCharaters;
@property NSArray *arrCounts;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
