//
//  MyCharacterVC.m
//  Pirate
//
//  Created by beauty on 3/19/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "MyCharacterVC.h"
#import "MyCharacterCell.h"

#import "WebServiceManager.h"
#import "MBProgressHUD.h"


@interface MyCharacterVC ()

@end

@implementation MyCharacterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.arrCharaters = @[@"Personality", @"Behaviour", @"Morality", @"Quality"];
    self.arrCounts = @[@"123", @"55", @"42", @"30"];
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
    
    [[WebServiceManager sharedInstance] getCharactersWithId:user_id completionHandler:^(id obj) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSDictionary *dicResponse = (NSDictionary*)obj;
        NSLog(@"%@", dicResponse);
        
    } errorHandler:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    
}

#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrCharaters.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float rowHeight = 98 * screenSize.height / 1920.0f;
    return rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCharacterCellIdentifier" forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    cell.lblTitle.text = self.arrCharaters[row];
    cell.lblCounts.text = self.arrCounts[row];
    return cell;
}

@end
