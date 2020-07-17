//
//  ReceiveInvitationCell.h
//  Pirate
//
//  Created by beauty on 4/25/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiveInvitationCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblRate;

@property (strong, nonatomic) IBOutlet UIView *viewAcceptFriendship;
@property (strong, nonatomic) IBOutlet UILabel *lblAcceptFriendship;

@end
