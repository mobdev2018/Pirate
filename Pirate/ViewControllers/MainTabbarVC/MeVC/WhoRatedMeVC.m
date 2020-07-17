//
//  WhoRatedMeVC.m
//  Pirate
//
//  Created by beauty on 3/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "WhoRatedMeVC.h"
#import "WhoRatedMeCell.h"

#import "WebServiceManager.h"
#import "MBProgressHUD.h"

@interface WhoRatedMeVC ()
{
    NSMutableArray *arrRaters;
}


@end

@implementation WhoRatedMeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrRaters = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    int user_id = [[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"] intValue];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebServiceManager sharedInstance] getRatersWithId:user_id completionHandler:^(id obj) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSDictionary *dicResponse = (NSDictionary*)obj;
        arrRaters = [dicResponse valueForKey:@"raters"];
        [self.tableView reloadData];
        
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrRaters.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float rowHeight = 148 * screenSize.height / 1920.0f;
    return rowHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WhoRatedMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WhoRatedMeCellIdentifier" forIndexPath:indexPath];
    
    return cell;
}


@end
