//
//  ContactVC.m
//  Pirate
//
//  Created by beauty on 4/20/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "ContactVC.h"
#import "ApplyJobSuccessfulVC.h"

@interface ContactVC ()

@end

@implementation ContactVC

@synthesize m_statusType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!m_statusType) m_statusType = Hired;
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
    
    float contactTitleFontSize = 48 * screenSize.height / 1920.0f;
    [self.lblContactTitle setFont:[UIFont systemFontOfSize:contactTitleFontSize weight:0.3f]];
    [self.lblDeliveryDate setFont:[UIFont systemFontOfSize:contactTitleFontSize weight:0.3f]];
    
    float descriptionTextFontSize = 36 * screenSize.height / 1920.0f;
    [self.txtDescription setFont:[UIFont systemFontOfSize:descriptionTextFontSize weight:0.05f]];

    UIColor *grayColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1.0f];
    self.viewRoleAndRate.layer.borderWidth = 1;
    self.viewRoleAndRate.layer.borderColor = grayColor.CGColor;
    self.viewRoleAndRate.layer.cornerRadius = 5.0f;
    
    UIColor *blueColor = [UIColor colorWithRed:8/255.0f green:149/255.0f blue:218/255.0f alpha:1.0f];
    self.viewDate.layer.borderWidth = 1.0f;
    self.viewDate.layer.borderColor = blueColor.CGColor;
    self.viewDate.layer.cornerRadius = 5.0f;
    
    switch (m_statusType) {
        case Hired:
            [self.btnAccept setTitle:@"Submit Change" forState:UIControlStateNormal];
            break;
        case Invited:
            [self.btnAccept setTitle:@"Accept Contact" forState:UIControlStateNormal];
        default:
            break;
    }
    self.btnAccept.layer.cornerRadius = 3.0f;

    
}

#pragma mark - button events

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onCalendar:(id)sender {
}

- (IBAction)onAccept:(id)sender {
    ApplyJobSuccessfulVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ApplyJobSuccessfulVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
