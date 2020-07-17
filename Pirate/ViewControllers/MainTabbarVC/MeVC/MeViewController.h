//
//  MeViewController.h
//  Pirate
//
//  Created by beauty on 3/18/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController

@property (strong, nonatomic) UIViewController *childViewController;
@property (strong, nonatomic) UIView *childView;

@property (strong, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (strong, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblYouHaveLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblCreditsCount;
@property (strong, nonatomic) IBOutlet UILabel *lblCreditsLabel;

@property (strong, nonatomic) IBOutlet UIButton *btnBuymoredredits;


@property (strong, nonatomic) IBOutlet UIButton *btnAnalysis;
@property (strong, nonatomic) IBOutlet UIButton *btnMyCharacter;
@property (strong, nonatomic) IBOutlet UIButton *btnWhoratedme;

@property (strong, nonatomic) IBOutlet UIView *containterView;

- (IBAction)onBuyMoreCredits:(id)sender;


- (IBAction)onAnalysis:(id)sender;
- (IBAction)onMyCharacter:(id)sender;
- (IBAction)onWhoRatedMe:(id)sender;



@end
