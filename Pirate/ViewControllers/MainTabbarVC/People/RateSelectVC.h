//
//  RateSelectVC.h
//  Pirate
//
//  Created by aaa on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RateSelectVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *arrIcons;
@property (nonatomic, strong) NSArray *arrTitles;

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)onBack:(id)sender;
@end
