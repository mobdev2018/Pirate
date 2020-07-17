//
//  PostJobVC.m
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "PostJobVC.h"
#import "JobsVC.h"

@interface PostJobVC ()

@end

@implementation PostJobVC

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
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.titleEditView.layer setBorderWidth:1.0f];
    [self.titleEditView.layer setBorderColor:blueColor.CGColor];
    self.titleEditView.layer.cornerRadius = 5.0f;
    
    [self.categoryEditView.layer setBorderWidth:1.0f];
    [self.categoryEditView.layer setBorderColor:blueColor.CGColor];
    self.categoryEditView.layer.cornerRadius = 5.0f;
    
    [self.salaryEditView.layer setBorderWidth:1.0f];
    [self.salaryEditView.layer setBorderColor:blueColor.CGColor];
    self.salaryEditView.layer.cornerRadius = 5.0f;
    
    [self.txtDescription.layer setBorderWidth:1.0f];
    [self.txtDescription.layer setBorderColor:blueColor.CGColor];
    self.txtDescription.layer.cornerRadius = 5.0f;
    
    self.btnPostNow.layer.cornerRadius = 3.0f;
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

- (IBAction)onCategorySelect:(id)sender {
}

- (IBAction)onSalarySelect:(id)sender {
}

- (IBAction)onPostNow:(id)sender {
    JobsVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"JobsVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
