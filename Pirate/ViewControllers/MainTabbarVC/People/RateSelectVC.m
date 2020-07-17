//
//  RateSelectVC.m
//  Pirate
//
//  Created by aaa on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "RateSelectVC.h"
#import "RateSelectCell.h"

@interface RateSelectVC ()
{
    CGSize screenSize;
}
@end

@implementation RateSelectVC
@synthesize arrIcons;
@synthesize arrTitles;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrTitles = @[@"Work", @"Business", @"Relationship", @"Family", @"Friend", @"Public Figure"];
    arrIcons = @[@"work_icon.png", @"business_icon.png", @"relationship_icon.png", @"family_icon.png", @"friend_icon.png", @"public_figure_icon.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    screenSize = [UIScreen mainScreen].bounds.size;
    
    float titleLabelFontSize = 72 * screenSize.height / 1920.0f;
    [self.lblNavTitle setFont:[UIFont systemFontOfSize:titleLabelFontSize weight:0.3f]];
    
}

#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrTitles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 168 * screenSize.height / 1920.0f;
    return cellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RateSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RateSelectCellIdentifier" forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    
    float titleFontSize = 42 * screenSize.height / 1920.0f;
    [cell.lblTitle setFont:[UIFont systemFontOfSize:titleFontSize weight:0.1f]];
    
    cell.lblTitle.text = arrTitles[row];
    cell.imgIcon.image = [UIImage imageNamed:arrIcons[row]];
    
    return cell;
}

#pragma mark - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    switch (row) {
        case 0: // Work
            
            break;
        case 1: // Business
            
            break;
        case 2: // Relationship
            break;
        case 3: // Family
            break;
        case 4: // Friend
            break;
        case 5: // Public Figure
            break;
        default:
            break;
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

#pragma mark - button events

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
