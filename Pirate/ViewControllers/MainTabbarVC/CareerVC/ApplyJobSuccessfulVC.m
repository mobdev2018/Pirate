//
//  ApplyJobSuccessfulVC.m
//  Pirate
//
//  Created by beauty on 4/21/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ApplyJobSuccessfulVC.h"

@implementation ApplyJobSuccessfulVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float navTitleFontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:navTitleFontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];

    float congratulationLabelFontSize = 84 * screenSize.height / 1920.0f;
    [self.lblCongratulation setFont:[UIFont systemFontOfSize:congratulationLabelFontSize weight:0.3f]];
}


- (IBAction)onBack:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
