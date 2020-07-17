//
//  ApplicationVC.h
//  Pirate
//
//  Created by beauty on 4/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UILabel *lblApplicationTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblCoverLetter;
@property (strong, nonatomic) IBOutlet UITextField *txtCoverLetter;
@property (strong, nonatomic) IBOutlet UILabel *lblCV;
@property (strong, nonatomic) IBOutlet UITextField *txtCV;

@property (strong, nonatomic) IBOutlet UIButton *btnUpload;
@property (strong, nonatomic) IBOutlet UIButton *btnSentApplication;

- (IBAction)onBack:(id)sender;
- (IBAction)onUpload:(id)sender;
- (IBAction)onSent:(id)sender;


@end
