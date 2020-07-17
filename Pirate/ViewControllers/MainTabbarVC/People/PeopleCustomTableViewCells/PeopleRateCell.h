//
//  PeopleRateCell.h
//  Pirate
//
//  Created by aaa on 4/22/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleRateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblComment;
@property (weak, nonatomic) IBOutlet UILabel *lblRate;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmitRate;



@end
