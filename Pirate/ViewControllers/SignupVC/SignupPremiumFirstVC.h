//
//  SignupPremiumVC.h
//  Pirate
//
//  Created by beauty on 3/14/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupPremiumFirstVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtNickName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtRetypePassword;


@property (strong, nonatomic) IBOutlet UIButton *btnNext;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

- (IBAction)onBack:(id)sender;
- (IBAction)onNext:(id)sender;

@end
