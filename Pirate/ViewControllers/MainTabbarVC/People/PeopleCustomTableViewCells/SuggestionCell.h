//
//  SuggestionCell.h
//  Pirate
//
//  Created by aaa on 4/24/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionCell : UITableViewCell

@property NSDictionary *mData;

@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblRating;

@property (weak, nonatomic) IBOutlet UIView *viewAddFriendButton;
@property (weak, nonatomic) IBOutlet UILabel *lblAddFriend;
@property (strong, nonatomic) IBOutlet UIButton *btnAddFriend;


@end
