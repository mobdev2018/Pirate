//
//  ManageSettingsVC.m
//  Pirate
//
//  Created by beauty on 4/11/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ManageSettingsVC.h"

@interface ManageSettingsVC ()

@end

@implementation ManageSettingsVC

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
    [self.lblNavTitle setFont:titleFont];
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.txtCardNo.layer setBorderWidth:1.0f];
    [self.txtCardNo.layer setBorderColor:blueColor.CGColor];
    self.txtCardNo.layer.cornerRadius = 5.0f;

    [self.txtCVVCode.layer setBorderWidth:1.0f];
    [self.txtCVVCode.layer setBorderColor:blueColor.CGColor];
    self.txtCVVCode.layer.cornerRadius = 5.0f;
    
    [self.viewMonth.layer setBorderWidth:1.0f];
    [self.viewMonth.layer setBorderColor:blueColor.CGColor];
    self.viewMonth.layer.cornerRadius = 5.0f;
    
    [self.viewYear.layer setBorderWidth:1.0f];
    [self.viewYear.layer setBorderColor:blueColor.CGColor];
    self.viewYear.layer.cornerRadius = 5.0f;
    
    
}


- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)onPaypal:(id)sender {
}

- (IBAction)onQuestion:(id)sender {
}

- (IBAction)onPayNow:(id)sender {
}
@end
