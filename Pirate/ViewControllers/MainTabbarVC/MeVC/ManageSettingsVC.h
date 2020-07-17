//
//  ManageSettingsVC.h
//  Pirate
//
//  Created by beauty on 4/11/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageSettingsVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtCardNo;
@property (strong, nonatomic) IBOutlet UIView *viewMonth;
@property (strong, nonatomic) IBOutlet UIView *viewYear;

@property (strong, nonatomic) IBOutlet UITextField *txtCVVCode;

- (IBAction)onBack:(id)sender;
- (IBAction)onPaypal:(id)sender;

- (IBAction)onQuestion:(id)sender;

- (IBAction)onPayNow:(id)sender;



@end
