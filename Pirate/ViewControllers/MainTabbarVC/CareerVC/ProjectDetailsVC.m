//
//  ProjectDetailsVC.m
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ProjectDetailsVC.h"

@interface ProjectDetailsVC ()

@end

@implementation ProjectDetailsVC

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
    UIFont *titleFont = [UIFont systemFontOfSize:navTitleFontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
    
    float titleFontSize = 54 * screenSize.height / 1920.0f;
    [self.lblProjectTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.2f]];
    
    float salaryFontSize = 44 * screenSize.height / 1920.0f;
    [self.lblProjectSalary setFont:[UIFont systemFontOfSize:salaryFontSize weight:0.1f]];
    
    float detailsLabelFontSize = 38 * screenSize.height / 1920.0f;
    [self.lblProjectDetails setFont:[UIFont systemFontOfSize:detailsLabelFontSize weight:0.2f]];
    [self.txtProjectDetails setFont:[UIFont systemFontOfSize:detailsLabelFontSize weight:0.05f]];
    
    
    self.txtProjectDetails.contentInset = UIEdgeInsetsMake(-8, -4, 0, 0);
    self.txtProjectDetails.textAlignment = NSTextAlignmentLeft;
    
    self.btnApplyThisJob.layer.cornerRadius = 3.0f;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onApplyThisJob:(id)sender {
}
@end
