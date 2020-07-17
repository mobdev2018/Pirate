//
//  IntroViewController.m
//  Pirate
//
//  Created by beauty on 3/10/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.btnSignup.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnSignup.layer setBorderWidth:1.0f];
    self.btnSignup.layer.cornerRadius = 3.0f;
    
    [self.btnLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnLogin.layer setBorderWidth:1.0f];
    self.btnLogin.layer.cornerRadius = 3.0f;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignup:(id)sender
{
    
}

- (IBAction)onLogin:(id)sender {
}
@end
