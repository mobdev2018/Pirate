//
//  IntroViewController.h
//  Pirate
//
//  Created by beauty on 3/10/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnSignup;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;

- (IBAction)onSignup:(id)sender;
- (IBAction)onLogin:(id)sender;

@end

