//
//  AnalysisVC.m
//  Pirate
//
//  Created by beauty on 3/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "AnalysisSubVC.h"
#import "WebServiceManager.h"
#import "MBProgressHUD.h"
#import "UserInfo.h"

@interface AnalysisSubVC ()

@end

@implementation AnalysisSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int user_id = [[UserInfo standardUserInfo].user_id intValue];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebServiceManager sharedInstance] getAnalysisWithId:user_id completionHandler:^(id obj) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSLog(@"%@", dicResponse);
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
