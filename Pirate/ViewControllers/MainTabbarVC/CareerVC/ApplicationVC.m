//
//  ApplicationVC.m
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ApplicationVC.h"

@interface ApplicationVC ()

@end

@implementation ApplicationVC

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
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    [self.txtCoverLetter.layer setBorderWidth:1.0f];
    [self.txtCoverLetter.layer setBorderColor:blueColor.CGColor];
    self.txtCoverLetter.layer.cornerRadius = 5.0f;
    
    [self.txtCV.layer setBorderWidth:1.0f];
    [self.txtCV.layer setBorderColor:blueColor.CGColor];
    self.txtCV.layer.cornerRadius = 5.0f;
    
    self.btnUpload.layer.cornerRadius = 3.0f;
    self.btnSentApplication.layer.cornerRadius = 3.0f;    
    
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

- (IBAction)onUpload:(id)sender {
}

- (IBAction)onSent:(id)sender {
}
@end
