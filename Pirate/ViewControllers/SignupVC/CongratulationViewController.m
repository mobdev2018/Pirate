//
//  CongratulationViewController.m
//  Pirate
//
//  Created by beauty on 3/12/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "CongratulationViewController.h"

@interface CongratulationViewController ()

@end

@implementation CongratulationViewController

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
    
    fontSize = 80 * screenSize.height / 1920.0f;
    [self.lblCongratulation setFont:[UIFont systemFontOfSize:fontSize weight:0.3f]];
    
    fontSize = 48 * screenSize.height / 1920.0f;
    [self.lblContentLabel setFont:[UIFont systemFontOfSize:fontSize weight:0.3f]];
    
    
    self.btnManageProfile.layer.cornerRadius = 3.0f;
    
}


- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onManageProfile:(id)sender
{
    UITabBarController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabbarVC"];
    [self presentViewController:vc animated:NO completion:nil];
}

@end
