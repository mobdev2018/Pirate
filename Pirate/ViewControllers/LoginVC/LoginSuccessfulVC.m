//
//  LoginSuccessfulVC.m
//  Pirate
//
//  Created by beauty on 3/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "LoginSuccessfulVC.h"
#import "MeViewController.h"

@interface LoginSuccessfulVC ()

@end

@implementation LoginSuccessfulVC

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
    
    [UIView animateWithDuration:1.0f delay:2.0f options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        [self.view setAlpha:0.3f];
    } completion:^(BOOL finished) {
        
        UITabBarController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabbarVC"];
//        MeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MeVC"];
        [self presentViewController:vc animated:NO completion:nil];
    }];
    
}




@end
