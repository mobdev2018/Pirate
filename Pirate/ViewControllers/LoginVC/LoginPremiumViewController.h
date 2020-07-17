//
//  LoginPremiumViewController.h
//  Pirate
//
//  Created by beauty on 3/13/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPremiumViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnFingerscan;

@property (strong, nonatomic) IBOutlet UILabel *lblFingerLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblVoicerecordLabel;



- (IBAction)onBack:(id)sender;
- (IBAction)onFingerscan:(id)sender;
- (IBAction)onVoicerecord:(id)sender;

@end
