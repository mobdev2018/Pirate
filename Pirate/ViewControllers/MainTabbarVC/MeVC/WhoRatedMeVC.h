//
//  WhoRatedMeVC.h
//  Pirate
//
//  Created by beauty on 3/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhoRatedMeVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
