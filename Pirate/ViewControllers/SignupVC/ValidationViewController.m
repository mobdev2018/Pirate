//
//  ValidationViewController.m
//  Pirate
//
//  Created by beauty on 3/11/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ValidationViewController.h"
#import "CongratulationViewController.h"

#import "WebServiceManager.h"
#import "MBProgressHUD.h"

@interface ValidationViewController ()

@end

@implementation ValidationViewController

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
    
    float titlefontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:titlefontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    float textFontSize = 36 * screenSize.height / 1920.0f;
    [self.lblText1 setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblText2 setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    
    float btnValidationCodeFontSize = 42 * screenSize.height / 1920.0f;
    [self.btnValidationCode.titleLabel setFont:[UIFont systemFontOfSize:btnValidationCodeFontSize weight:0.3f]];
    
    [self.txtValidationCode.layer setBorderWidth:1.0f];
    UIColor *borderColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.txtValidationCode.layer setBorderColor:borderColor.CGColor];
    self.txtValidationCode.layer.cornerRadius = 5.0f;
    
    float profileHeight = 360 * screenSize.height / 1920.0f;
    self.imgProfile.layer.cornerRadius = profileHeight / 2;
    
    [self.btnChoose.layer setBorderWidth:2.0f];
    [self.btnChoose.layer setBorderColor:borderColor.CGColor];
    self.btnChoose.layer.cornerRadius = 5.0f;
    
    [self.btnUpload.layer setBorderWidth:2.0f];
    [self.btnUpload.layer setBorderColor:borderColor.CGColor];
    self.btnUpload.layer.cornerRadius = 5.0f;
    
    self.btnConfirm.layer.cornerRadius = 5.0f;
}

#pragma mark - imagePicker

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imgProfile.image = chosenImage;

    [picker dismissViewControllerAnimated:YES completion:NULL];
}


-(void)takePhoto
{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else
    {
        [self showDefaultAlert:nil message:@"No Camera Abailable."];
    }
}

-(void)selectPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing  = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - actions

- (IBAction)onChoose:(id)sender
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select a Photo" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Take a Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Take a Photo");
            
            [self takePhoto];
            
        }];
        [alert addAction:cameraAction];
        
        UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"Get From Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Get from a photo library");
            [self selectPhoto];
        }];
        [alert addAction:galleryAction];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"Cancel action");
                                       }];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select a Photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo", @"Get From Photo Library", nil];
        [actionSheet showInView:self.view];
    }
}

- (IBAction)onUpload:(id)sender
{
    
}

- (IBAction)onConfirm:(id)sender
{
    NSString *strValidationCode = self.txtValidationCode.text;
    if ([strValidationCode isEqualToString:@""])
    {
        [self showDefaultAlert:@"Error" message:@"Please check your email and enter your validation code."];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary *parameters = @{@"code": strValidationCode};
    [[WebServiceManager sharedInstance] verificationUserWithData:parameters completionHandler:^(id obj) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        CongratulationViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CongratulationVC"];
        [self.navigationController pushViewController:vc animated:YES];
        
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Error" message:@"Verification Failed!"];
    }];
    
}

- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onValidationCode:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebServiceManager sharedInstance] resendingVerificationCodeWithCompletionHandler:^(id obj) {
       
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Complete" message:@"Sent verification code completely!"];
        
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self showDefaultAlert:@"Error" message:@"Failed sending verification code!"];
    }];
    
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




@end
