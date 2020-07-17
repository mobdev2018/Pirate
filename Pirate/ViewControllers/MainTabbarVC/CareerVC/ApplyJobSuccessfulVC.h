//
//  ApplyJobSuccessfulVC.h
//  Pirate
//
//  Created by beauty on 4/21/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplyJobSuccessfulVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblCongratulation;


- (IBAction)onBack:(id)sender;
@end
