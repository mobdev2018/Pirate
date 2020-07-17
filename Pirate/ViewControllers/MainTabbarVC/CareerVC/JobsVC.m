//
//  JobsVC.m
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "JobsVC.h"
#import "JobsCell.h"

@interface JobsVC ()

@end

@implementation JobsVC

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
    
    float fontSize = 72 * screenSize.height / 1920.0f;
    UIFont *titleFont = [UIFont systemFontOfSize:fontSize weight:0.3f];
    [self.lblNavTitle setFont:titleFont];
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


#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float height = 212 * screenSize.height / 1920.0f;
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JobsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsCellIdentifier" forIndexPath:indexPath];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float fontSize = 42 * screenSize.height / 1920.0f;
    
    [cell.lblJobTitle setFont:[UIFont systemFontOfSize:fontSize]];
    [cell.lblJobDescription setFont:[UIFont systemFontOfSize:fontSize]];
    
    
    return cell;
}



@end
