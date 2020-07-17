//
//  LoginViewController.m
//  Pirate
//
//  Created by beauty on 3/10/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "LoginViewController.h"
#import "ValidationViewController.h"
#import "UserInfo.h"

#import "WebServiceManager.h"
#import "MBProgressHUD.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float fontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:fontSize weight:0.3f];
    [self.lblLoginTitle setFont:titleFont];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.txtEmail.layer setBorderWidth:1.0f];
    [self.txtEmail.layer setBorderColor:blueColor.CGColor];
    self.txtEmail.layer.cornerRadius = 5.0f;
    
    [self.txtPassword.layer setBorderWidth:1.0f];
    [self.txtPassword.layer setBorderColor:blueColor.CGColor];
    self.txtPassword.layer.cornerRadius = 5.0f;
    
    [self registerForKeyboardNotifications];
}

- (IBAction)onLogin:(id)sender
{
    NSString *strEmail = self.txtEmail.text;
    NSString *strPassword = self.txtPassword.text;
    
    if ([strEmail isEqualToString:@""])
    {
        [self showDefaultAlert:@"Error" message:@"Please enter your email."];
        return;
    }
    if ([strPassword isEqualToString:@""])
    {
        [self showDefaultAlert:@"Error" message:@"Please enter your password."];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary *parameters = @{@"email": strEmail, @"password": strPassword};
    [[WebServiceManager sharedInstance] loginUserWithData:parameters completionHandler:^(id obj) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSString *strResponse = [dicResponse valueForKey:@"response"];
        NSDictionary *user = [dicResponse objectForKey:@"user"];
        if ([strResponse isEqualToString:@"Account Verification Required"] || user == nil)
        {
            ValidationViewController *validationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ValidationVC"];
            [self.navigationController pushViewController:validationVC animated:YES];
        }
        else
        {
            [[UserInfo standardUserInfo] getUserInfoFromDictionary:user];

            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginSuccessfulVC"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    } errorHandler:^(NSError *error) {
        NSLog(@"%@", error);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Failed" message:@"Login Failed."];
    }];
    
}


- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
//    NSDictionary *info = [notification userInfo];
//    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [UIView animateWithDuration:0.3f animations:^{
        [self.view setFrame:CGRectMake(0, -100, screenSize.width, screenSize.height)];
        [self.view layoutIfNeeded];
    }];
    
}

-(void)keyboardWillBeHidden:(NSNotification *)notification
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [UIView animateWithDuration:0.3f animations:^{
        [self.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
        [self.view layoutIfNeeded];
    }];
}

@end
