//
//  MeViewController.m
//  Pirate
//
//  Created by beauty on 3/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "MeViewController.h"
#import "AnalysisSubVC.h"
#import "MyCharacterVC.h"
#import "ManageSettingsVC.h"

#import "UserInfo.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserInfo *userInfo = [UserInfo standardUserInfo];
    NSString *strName = [NSString stringWithFormat:@"%@ %@", userInfo.fname, userInfo.lname];
    self.lblNavTitle.text = strName;
    
    [self replaceChildView:[self.storyboard instantiateViewControllerWithIdentifier:@"AnalysisSubVC"]];
    
    
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
    
    float textFontSize = 40 * screenSize.height / 1980.0f;

    [self.lblName setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblYouHaveLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblCreditsLabel setFont:[UIFont systemFontOfSize:textFontSize weight:0.1f]];
    [self.lblCreditsCount setFont:[UIFont systemFontOfSize:textFontSize weight:0.3f]];
    
   

}

#pragma mark - button events

- (IBAction)onBuyMoreCredits:(id)sender
{
    ManageSettingsVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ManageSettingsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onAnalysis:(id)sender
{
    [self.btnAnalysis setBackgroundColor:[UIColor clearColor]];
    [self.btnAnalysis setTitleColor:[UIColor colorWithRed:8/255.0f green:149.0/255.0f blue:218/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [self.btnMyCharacter setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnWhoratedme setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnWhoratedme setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnMyCharacter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [self replaceChildView:[self.storyboard instantiateViewControllerWithIdentifier:@"AnalysisSubVC"]];
    
}

- (IBAction)onMyCharacter:(id)sender
{
    [self.btnAnalysis setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnAnalysis setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnMyCharacter setBackgroundColor:[UIColor clearColor]];
    [self.btnMyCharacter setTitleColor:[UIColor colorWithRed:8/255.0f green:149.0/255.0f blue:218/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [self.btnWhoratedme setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnWhoratedme setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self replaceChildView:[self.storyboard instantiateViewControllerWithIdentifier:@"MyCharacterVC"]];
    
}

- (IBAction)onWhoRatedMe:(id)sender
{
    [self.btnAnalysis setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnAnalysis setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnMyCharacter setBackgroundColor:[UIColor colorWithRed:210/255.0f green:210/255.0f blue:210/255.0f alpha:1.0f]];
    [self.btnMyCharacter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnWhoratedme setBackgroundColor:[UIColor clearColor]];
    [self.btnWhoratedme setTitleColor:[UIColor colorWithRed:8/255.0f green:149.0/255.0f blue:218/255.0f alpha:1.0f] forState:UIControlStateNormal];
    
    [self replaceChildView:[self.storyboard instantiateViewControllerWithIdentifier:@"WhoRatedMeVC"]];
    
}


-(void)replaceChildView:(UIViewController*)viewController
{
    if (self.childView != nil) {
        [self.childView removeFromSuperview];
        [self.childViewController removeFromParentViewController];
    }
    
    self.childViewController = viewController;
    self.childView = viewController.view;
    
    CGRect rect = self.containterView.frame;
    rect.origin = CGPointMake(0, 0);
    [self.childView setFrame:rect];
    [self.containterView addSubview:self.childView];
    [self addChildViewController:self.childViewController];
}


@end
