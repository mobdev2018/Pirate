//
//  GiveRatingVC.m
//  Pirate
//
//  Created by aaa on 4/24/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "GiveRatingVC.h"

@interface GiveRatingVC ()

@end

@implementation GiveRatingVC

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
    
    float navTitleFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:navTitleFontSize weight:0.3f]];
    
    float nameLabelFontSize = 60 * screenSize.height / 1920.0f;
    [self.lblName setFont:[UIFont systemFontOfSize:nameLabelFontSize weight:0.2f]];
    
    float givemeratingLabelFontSize = 40 * screenSize.height / 1920.0f;
    [self.lblGiveMeRating setFont:[UIFont systemFontOfSize:givemeratingLabelFontSize]];
    
    float buttonTitleFontSize = 48 * screenSize.height / 1920.0f;
    [self.lblPositive setFont:[UIFont systemFontOfSize:buttonTitleFontSize weight:0.2f]];
    [self.lblNegative setFont:[UIFont systemFontOfSize:buttonTitleFontSize weight:0.2f]];
    
    self.viewPositive.layer.cornerRadius = 5.0f;
    self.viewNegative.layer.cornerRadius = 5.0f;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - button events

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onPositive:(id)sender {
}

- (IBAction)onNegative:(id)sender {
}
@end
