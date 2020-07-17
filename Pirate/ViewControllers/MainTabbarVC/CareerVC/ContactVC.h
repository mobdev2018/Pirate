//
//  ContactVC.h
//  Pirate
//
//  Created by beauty on 4/20/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum Status_Type{
    Hired,
    Invited,
}StatusType;

@interface ContactVC : UIViewController

@property StatusType m_statusType;

@property (weak, nonatomic) IBOutlet UILabel *lblNavTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblContactTitle;

@property (weak, nonatomic) IBOutlet UIView *viewRoleAndRate;

@property (weak, nonatomic) IBOutlet UIButton *btnRole;
@property (weak, nonatomic) IBOutlet UIButton *btnRate;

@property (weak, nonatomic) IBOutlet UILabel *lblDeliveryDate;

@property (weak, nonatomic) IBOutlet UIView *viewDate;
@property (weak, nonatomic) IBOutlet UITextField *txtDeliveryDate;

@property (weak, nonatomic) IBOutlet UITextView *txtDescription;

@property (weak, nonatomic) IBOutlet UIButton *btnAccept;

- (IBAction)onBack:(id)sender;
- (IBAction)onCalendar:(id)sender;

- (IBAction)onAccept:(id)sender;



@end
