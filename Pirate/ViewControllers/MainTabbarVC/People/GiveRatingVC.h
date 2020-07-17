//
//  GiveRatingVC.h
//  Pirate
//
//  Created by aaa on 4/24/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiveRatingVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCharacteristics;

@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblGiveMeRating;

@property (weak, nonatomic) IBOutlet UIView *viewPositive;
@property (weak, nonatomic) IBOutlet UIView *viewNegative;
@property (weak, nonatomic) IBOutlet UILabel *lblPositive;
@property (weak, nonatomic) IBOutlet UILabel *lblNegative;



- (IBAction)onBack:(id)sender;
- (IBAction)onPositive:(id)sender;
- (IBAction)onNegative:(id)sender;


@end
