//
//  InvitePeopleCell.h
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvitePeopleCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblRate;

@property (strong, nonatomic) IBOutlet UIButton *btnInvite;


@end
