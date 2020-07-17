//
//  OtherProfileVC.m
//  Pirate
//
//  Created by beauty on 4/27/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "OtherProfileVC.h"
#import "UserInfo.h"

@interface OtherProfileVC ()

@end

@implementation OtherProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserInfo *userInfo = [UserInfo standardUserInfo];
    NSString *strName = [NSString stringWithFormat:@"%@ %@", userInfo.fname, userInfo.lname];
    self.lblNavTitle.text = strName;
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
    
    float profileImageHeight = 362 * screenSize.height / 1920.0f;
    self.imgProfile.layer.cornerRadius = profileImageHeight / 2.0f;
    
    float nameFontSize = 60 * screenSize.height / 1920.0f;
    [self.lblName setFont:[UIFont systemFontOfSize:nameFontSize weight:0.3f]];
    
    float rateFontSize = 48 * screenSize.height / 1920.0f;
    [self.lblRate setFont:[UIFont systemFontOfSize:rateFontSize weight:0.2f]];
    
    float subTitleFontSize = 42 * screenSize.height / 1920.0f;
    [self.lblSubTitle setFont:[UIFont systemFontOfSize:subTitleFontSize weight:0.1f]];
    
    float descriptionFontSize = 36 * screenSize.height / 1920.0f;
    [self.lblDescription setFont:[UIFont systemFontOfSize:descriptionFontSize]];
    
    float buttonTitleFontSize = 48 * screenSize.height / 1920.0f;
    [self.btnInvite.titleLabel setFont:[UIFont systemFontOfSize:buttonTitleFontSize weight:0.3f]];
    self.btnInvite.layer.cornerRadius = 5.0f;
    
    [self.btnSendMessage.titleLabel setFont:[UIFont systemFontOfSize:buttonTitleFontSize weight:0.3f]];
    self.btnSendMessage.layer.cornerRadius = 5.0f;
    
    [self.btnRate.titleLabel setFont:[UIFont systemFontOfSize:buttonTitleFontSize weight:0.3f]];
    self.btnRate.layer.cornerRadius = 5.0f;   
    
    // set Datas
    [self setDatas];
}

-(void)setDatas
{
    if (self.dicData) {
        NSString *fName = [self.dicData valueForKey:@"fname"];
        NSString *lName = [self.dicData valueForKey:@"lname"];
        NSString *fullName = [NSString stringWithFormat:@"%@ %@", fName, lName];
        self.lblName.text = fullName;
        
    }
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

- (IBAction)onInvite:(id)sender {
}

- (IBAction)onSendMessage:(id)sender {
}

- (IBAction)onRateThisUser:(id)sender {
}
@end
