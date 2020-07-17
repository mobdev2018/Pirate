//
//  SignupPremiumSecondVC.h
//  Pirate
//
//  Created by beauty on 3/14/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupPremiumSecondVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableDictionary *dicParameters;
@property (strong, nonatomic) NSMutableArray *arrCountries;
@property (strong, nonatomic) NSMutableArray *arrCities;
@property (strong, nonatomic) NSMutableArray *arrZipcodes;
@property (strong, nonatomic) NSMutableArray *arrCountriesAndCities;

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;

@property (strong, nonatomic) IBOutlet UIView *viewSelectCountry;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;

@property (strong, nonatomic) IBOutlet UIView *viewSelectCity;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;

@property (strong, nonatomic) IBOutlet UIButton *btnSignup;
@property (strong, nonatomic) IBOutlet UIButton *btnLinkedin;

@property (strong, nonatomic) IBOutlet UILabel *lblTermsofServices1;
@property (strong, nonatomic) IBOutlet UILabel *lblTermsofServices2;

@property (strong, nonatomic) IBOutlet UIButton *btnPirate;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;



- (IBAction)onSelectCountry:(id)sender;
- (IBAction)onSelectCity:(id)sender;

- (IBAction)onBack:(id)sender;
- (IBAction)onSignup:(id)sender;
- (IBAction)onLinkedin:(id)sender;

- (IBAction)onPirate:(id)sender;



@end
