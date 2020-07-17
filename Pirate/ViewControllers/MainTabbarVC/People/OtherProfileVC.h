//
//  OtherProfileVC.h
//  Pirate
//
//  Created by beauty on 4/27/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherProfileVC : UIViewController

@property NSDictionary *dicData;

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblRate;
@property (strong, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@property (strong, nonatomic) IBOutlet UIButton *btnInvite;
@property (strong, nonatomic) IBOutlet UIButton *btnSendMessage;
@property (strong, nonatomic) IBOutlet UIButton *btnRate;


- (IBAction)onBack:(id)sender;
- (IBAction)onInvite:(id)sender;
- (IBAction)onSendMessage:(id)sender;
- (IBAction)onRateThisUser:(id)sender;

@end
