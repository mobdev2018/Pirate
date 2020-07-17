//
//  SignupViewController.h
//  Pirate
//
//  Created by beauty on 3/10/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;


@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtNickName;
@property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;

@property (strong, nonatomic) IBOutlet UIButton *btnSignup;
@property (strong, nonatomic) IBOutlet UIButton *btnSignupWithLinkedin;

@property (strong, nonatomic) IBOutlet UILabel *lblTermsOfServices;



- (IBAction)onSignup:(id)sender;
- (IBAction)onSignupWithLinkedin:(id)sender;
- (IBAction)onPirate:(id)sender;


@end
