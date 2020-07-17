//
//  LoginPremiumViewController.m
//  Pirate
//
//  Created by beauty on 3/13/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "LoginPremiumViewController.h"

@interface LoginPremiumViewController ()

@end

@implementation LoginPremiumViewController

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
    
    float titleFontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:titleFontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    float textFontSize = 48 * screenSize.height / 1920.0f;
    [self.lblFingerLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblVoicerecordLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    
}


- (IBAction)onBack:(id)sender
{
    
}

- (IBAction)onFingerscan:(id)sender {
}

- (IBAction)onVoicerecord:(id)sender {
}


@end
