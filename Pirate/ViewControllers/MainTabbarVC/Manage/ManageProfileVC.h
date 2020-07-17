//
//  ManageProfileVC.h
//  Pirate
//
//  Created by beauty on 5/5/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageProfileVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtTelephone;
@property (strong, nonatomic) IBOutlet UITextField *txtPlaceofbirth;
@property (strong, nonatomic) IBOutlet UITextField *txtDateofbirth;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtPostalcode;
@property (strong, nonatomic) IBOutlet UITextField *txtJobs;

@property (strong, nonatomic) IBOutlet UIButton *btnDone;
@property (strong, nonatomic) IBOutlet UIButton *btnFacebook;
@property (strong, nonatomic) IBOutlet UIButton *btnLinkedin;

- (IBAction)onBack:(id)sender;
- (IBAction)onDone:(id)sender;
- (IBAction)onFacebook:(id)sender;
- (IBAction)onLinkedin:(id)sender;

@end
