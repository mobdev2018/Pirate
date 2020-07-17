//
//  PostJobVC.h
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostJobVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UIView *titleEditView;
@property (strong, nonatomic) IBOutlet UITextField *txtTitle;

@property (strong, nonatomic) IBOutlet UIView *categoryEditView;
@property (strong, nonatomic) IBOutlet UITextField *txtCategory;

@property (strong, nonatomic) IBOutlet UIView *salaryEditView;
@property (strong, nonatomic) IBOutlet UITextField *txtSalary;

@property (strong, nonatomic) IBOutlet UITextView *txtDescription;

@property (strong, nonatomic) IBOutlet UIButton *btnPostNow;


- (IBAction)onBack:(id)sender;
- (IBAction)onCategorySelect:(id)sender;
- (IBAction)onSalarySelect:(id)sender;
- (IBAction)onPostNow:(id)sender;


@end
