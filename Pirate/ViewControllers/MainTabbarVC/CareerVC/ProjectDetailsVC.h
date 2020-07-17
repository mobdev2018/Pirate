//
//  ProjectDetailsVC.h
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDetailsVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblProjectTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblProjectSalary;
@property (strong, nonatomic) IBOutlet UILabel *lblProjectDetails;
@property (strong, nonatomic) IBOutlet UITextView *txtProjectDetails;

@property (strong, nonatomic) IBOutlet UIButton *btnApplyThisJob;

- (IBAction)onBack:(id)sender;
- (IBAction)onApplyThisJob:(id)sender;



@end
