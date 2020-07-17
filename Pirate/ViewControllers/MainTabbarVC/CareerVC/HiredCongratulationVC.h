//
//  HiredCongratulationVC.h
//  Pirate
//
//  Created by beauty on 4/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HiredCongratulationVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UILabel *lblCongratulationTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@property (strong, nonatomic) IBOutlet UIButton *btnReviewContact;

- (IBAction)onBack:(id)sender;

@end
