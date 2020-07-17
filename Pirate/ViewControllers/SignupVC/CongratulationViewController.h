//
//  CongratulationViewController.h
//  Pirate
//
//  Created by beauty on 3/12/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CongratulationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UILabel *lblCongratulation;
@property (strong, nonatomic) IBOutlet UILabel *lblContentLabel;

@property (strong, nonatomic) IBOutlet UIButton *btnManageProfile;

- (IBAction)onBack:(id)sender;
- (IBAction)onManageProfile:(id)sender;


@end
