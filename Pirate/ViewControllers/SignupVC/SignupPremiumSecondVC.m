//
//  SignupPremiumSecondVC.m
//  Pirate
//
//  Created by beauty on 3/14/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "SignupPremiumSecondVC.h"
#import "LoginViewController.h"
#import "ActionSheetPicker.h"
#import "WebServiceManager.h"
#import "MBProgressHUD.h"

@interface SignupPremiumSecondVC ()

@end

@implementation SignupPremiumSecondVC
@synthesize arrCountriesAndCities;
@synthesize arrCountries;
@synthesize arrCities;
@synthesize arrZipcodes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrCountries = [[NSMutableArray alloc]init];
    arrCities = [[NSMutableArray alloc] init];
    arrZipcodes = [[NSMutableArray alloc] init];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"CountryList" ofType:@"plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:strPath];
    arrCountriesAndCities = [[NSMutableArray alloc] init];
    arrCountriesAndCities = [dic objectForKey:@"Countries"];
    arrCities = [(NSDictionary*)arrCountriesAndCities[0] objectForKey:@"cities"];
    for (int i = 0; i < arrCountriesAndCities.count; i++) {
        NSDictionary *dicCountries = arrCountriesAndCities[i];
        NSString *strCountry = [dicCountries valueForKey:@"country"];
        NSString *strZipcode = [dicCountries valueForKey:@"zipcode"];
        [arrCountries addObject:strCountry];
        [arrZipcodes addObject:strZipcode];
    }
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
    [self.txtPhoneNumber.layer setBorderWidth:1.0f];
    [self.txtPhoneNumber.layer setBorderColor:blueColor.CGColor];
    self.txtPhoneNumber.layer.cornerRadius = 5.0f;
    
    [self.viewSelectCountry.layer setBorderWidth:1.0f];
    [self.viewSelectCountry.layer setBorderColor:blueColor.CGColor];
    self.viewSelectCountry.layer.cornerRadius = 5.0f;
    
    [self.viewSelectCity.layer setBorderWidth:1.0f];
    [self.viewSelectCity.layer setBorderColor:blueColor.CGColor];
    self.viewSelectCity.layer.cornerRadius = 5.0f;
    
    self.btnSignup.layer.cornerRadius = 5.0f;
    self.btnLinkedin.layer.cornerRadius = 5.0f;
    
    
    [self registerForKeyboardNotifications];
}


#pragma mark - button events

- (IBAction)onSelectCountry:(id)sender {
    
    [self.txtPhoneNumber resignFirstResponder];
    [ActionSheetStringPicker showPickerWithTitle:@"Select a Country" rows:arrCountries initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        self.txtCountry.text = arrCountries[selectedIndex];
        self.txtPhoneNumber.text = arrZipcodes[selectedIndex];
        
        NSDictionary *dic = arrCountriesAndCities[selectedIndex];
        arrCities = [dic objectForKey:@"cities"];
        
    } cancelBlock:^(ActionSheetStringPicker *picker) {
        
    } origin:self.viewSelectCountry];
    
}

- (IBAction)onSelectCity:(id)sender {
    [self.txtPhoneNumber resignFirstResponder];
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select a City" rows:arrCities initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        self.txtCity.text = arrCities[selectedIndex];
    } cancelBlock:^(ActionSheetStringPicker *picker) {
        
    } origin:self.viewSelectCity];
    
}

- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSignup:(id)sender
{
    NSString *strPhoneNumber = self.txtPhoneNumber.text;
    NSString *strCountry = self.txtCountry.text;
    NSString *strCity = self.txtCity.text;
    
    if ([strPhoneNumber isEqualToString:@""]) {
        [self showDefaultAlert:@"Error" message:@"Please type your phone number."];
        return;
    }

    [self.dicParameters setValue:strPhoneNumber forKey:@"phone_no"];
    [self.dicParameters setValue:strCountry forKey:@"country"];
    [self.dicParameters setValue:strCity forKey:@"city"];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[WebServiceManager sharedInstance] extendedRegisterUserWithData:self.dicParameters completionHandler:^(id obj){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        LoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self.navigationController pushViewController:loginVC animated:YES];
        
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"error: %@", error);
        [self showDefaultAlert:@"Failed" message:@"Sign up failed."];
    }];
    
}

- (IBAction)onLinkedin:(id)sender
{
    
}

- (IBAction)onPirate:(id)sender
{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.pirate-app.com/index.php?id=39"]];
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
