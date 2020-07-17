//
//  ManageProfileVC.m
//  Pirate
//
//  Created by beauty on 5/5/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ManageProfileVC.h"
#import "UserInfo.h"

@interface ManageProfileVC ()

@end

@implementation ManageProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserInfo *userInfo = [UserInfo standardUserInfo];
    NSString *strName = [NSString stringWithFormat:@"%@ %@", userInfo.fname, userInfo.lname];
    self.lblNavTitle.text = strName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float titleFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.3f]];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    
    self.txtName.layer.borderColor = blueColor.CGColor;
    self.txtName.layer.borderWidth = 1.0f;
    self.txtName.layer.cornerRadius = 5.0f;
    
    self.txtEmail.layer.borderWidth = 1.0f;
    self.txtEmail.layer.borderColor = blueColor.CGColor;
    self.txtEmail.layer.cornerRadius = 5.0f;
    
    self.txtTelephone.layer.borderWidth = 1.0f;
    self.txtTelephone.layer.borderColor = blueColor.CGColor;
    self.txtTelephone.layer.cornerRadius = 5.0f;
    
    self.txtCity.layer.borderWidth = 1.0f;
    self.txtCity.layer.borderColor = blueColor.CGColor;
    self.txtCity.layer.cornerRadius = 5.0f;
    
    self.txtAddress.layer.borderWidth = 1.0f;
    self.txtAddress.layer.borderColor = blueColor.CGColor;
    self.txtAddress.layer.cornerRadius = 5.0f;
    
    self.txtPlaceofbirth.layer.borderWidth = 1.0f;
    self.txtPlaceofbirth.layer.borderColor = blueColor.CGColor;
    self.txtPlaceofbirth.layer.cornerRadius = 5.0f;
    
    self.txtDateofbirth.layer.borderWidth = 1.0f;
    self.txtDateofbirth.layer.borderColor = blueColor.CGColor;
    self.txtDateofbirth.layer.cornerRadius = 5.0f;
    
    self.txtPostalcode.layer.borderWidth = 1.0f;
    self.txtPostalcode.layer.borderColor = blueColor.CGColor;
    self.txtPostalcode.layer.cornerRadius = 5.0f;
    
    self.txtJobs.layer.borderWidth = 1.0f;
    self.txtJobs.layer.borderColor = blueColor.CGColor;
    self.txtJobs.layer.cornerRadius = 5.0f;
    
    
    self.btnDone.layer.cornerRadius = 3.0f;
    self.btnFacebook.layer.cornerRadius = 3.0f;
    self.btnLinkedin.layer.cornerRadius = 3.0f;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - button events

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onDone:(id)sender {
}

- (IBAction)onFacebook:(id)sender {
}

- (IBAction)onLinkedin:(id)sender {
}
@end
