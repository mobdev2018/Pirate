//
//  SignupPremiumVC.m
//  Pirate
//
//  Created by beauty on 3/14/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "SignupPremiumFirstVC.h"
#import "SignupPremiumSecondVC.h"

@interface SignupPremiumFirstVC ()

@end

@implementation SignupPremiumFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float fontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:fontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.txtFirstName.layer setBorderWidth:1.0f];
    [self.txtFirstName.layer setBorderColor:blueColor.CGColor];
    self.txtFirstName.layer.cornerRadius = 5.0f;
    
    [self.txtLastName.layer setBorderWidth:1.0f];
    [self.txtLastName.layer setBorderColor:blueColor.CGColor];
    self.txtLastName.layer.cornerRadius = 5.0f;
    
    [self.txtNickName.layer setBorderWidth:1.0f];
    [self.txtNickName.layer setBorderColor:blueColor.CGColor];
    self.txtNickName.layer.cornerRadius = 5.0f;
    
    [self.txtEmail.layer setBorderWidth:1.0f];
    [self.txtEmail.layer setBorderColor:blueColor.CGColor];
    self.txtEmail.layer.cornerRadius = 5.0f;
    
    [self.txtPassword.layer setBorderWidth:1.0f];
    [self.txtPassword.layer setBorderColor:blueColor.CGColor];
    self.txtPassword.layer.cornerRadius = 5.0f;
    
    [self.txtRetypePassword.layer setBorderWidth:1.0f];
    [self.txtRetypePassword.layer setBorderColor:blueColor.CGColor];
    self.txtRetypePassword.layer.cornerRadius = 5.0f;
    
    self.btnNext.layer.cornerRadius = 5.0f;
    
    [self registerForKeyboardNotifications];
}



- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onNext:(id)sender
{
    NSString *strFirstName = self.txtFirstName.text;
    NSString *strLastName = self.txtLastName.text;
    NSString *strNickName = self.txtNickName.text;
    NSString *strEmail = self.txtEmail.text;
    NSString *strPassword = self.txtPassword.text;
    NSString *strConfirmPassword = self.txtRetypePassword.text;
    
    if ([strFirstName isEqualToString:@""]) {
        [self showDefaultAlert:@"Error" message:@"Type your first name."];
        return;
    }
    
    if ([strLastName isEqualToString:@""]) {
        [self showDefaultAlert:@"Error" message:@"Type your last name."];
        return;
    }
    
    if ([strEmail isEqualToString:@""]) {
        [self showDefaultAlert:@"Error" message:@"Type your email"];
        return;
    }
    else if (![self validateEmailWithString:strEmail])
    {
        [self showDefaultAlert:@"Error" message:@"The email is not validated"];
        return;
    }
    
    if ([strPassword isEqualToString:@""]) {
        [self showDefaultAlert:@"Error" message:@"Type your password"];
        return;
    }
    
    if (![strConfirmPassword isEqualToString:strPassword]) {
        [self showDefaultAlert:@"Error" message:@"Password does not match"];
        return;
    }
    
    
    SignupPremiumSecondVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupPremiumSecondVC"];
    vc.dicParameters = [@{@"fname": strFirstName, @"lname": strLastName, @"email": strEmail, @"nickname": strNickName, @"password": strPassword} mutableCopy];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


#pragma mark - show default alert
-(void) showDefaultAlert:(NSString *)title message:(NSString*)message
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


#pragma mark - TextField Delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Keyboard appears and disappears notification

-(void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)deregisterFromKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.bottomConstraint.constant = keyboardSize.height;
        [self.view layoutIfNeeded];
    }];
    
}

-(void)keyboardWillBeHidden:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3f animations:^{
        self.bottomConstraint.constant = 0.0f;
        [self.view layoutIfNeeded];
    }];
}


@end
