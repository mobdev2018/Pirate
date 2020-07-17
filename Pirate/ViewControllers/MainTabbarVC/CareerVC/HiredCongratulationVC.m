//
//  HiredCongratulationVC.m
//  Pirate
//
//  Created by beauty on 4/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "HiredCongratulationVC.h"

@interface HiredCongratulationVC ()

@end

@implementation HiredCongratulationVC

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
    
    float navTitleFontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:navTitleFontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    float titleFontSize = 84 * screenSize.height / 1920.0f;
    [self.lblCongratulationTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.3f]];
    
    float subTitleFontSize = 56 * screenSize.height / 1920.0f;
    [self.lblSubTitle setFont:[UIFont systemFontOfSize:subTitleFontSize weight:0.2f]];
    
    float descriptionFontSize = 42 * screenSize.height / 1920.0f;
    [self.lblDescription setFont:[UIFont systemFontOfSize:descriptionFontSize weight:0.05f]];
    
    self.btnReviewContact.layer.cornerRadius = 3.0f;
}


#pragma mark - button events
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = [segue identifier];
    if ([segueId isEqualToString:@"ToConactSegue"]) {
        
    }
}

@end
