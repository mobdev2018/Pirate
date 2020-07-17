//
//  UserInfo.h
//  Pirate
//
//  Created by beauty on 3/20/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property    NSNumber*   user_id;
@property    NSData*     emoticon;
@property    NSString*   currency;
@property    NSNumber*   status;
@property    NSString*   place_of_birth;
@property    NSNumber*   active;             // 1
@property    NSString*   created_at;         //"2016-03-18 10:46:35"
@property    NSString*   dob;                //"0000-00-00
@property    NSString*   phone_no;
@property    NSString*   residence;
@property    NSString*   registration_type;  // "extended"
@property    NSString*   level;              // "user"
@property    NSString*   city;
@property    NSString*   updated_at;         // "2016-03-18 10:50:42"
@property    NSString*   lname;
@property    NSString*   nickname;
@property    NSString*   email;
@property    NSString*   fname;
@property    NSString*   country;


+(instancetype)standardUserInfo;


-(void) getUserInfoFromDictionary:(NSDictionary*)dic;


@end
