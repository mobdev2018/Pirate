//
//  UserInfo.m
//  Pirate
//
//  Created by beauty on 3/20/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

@synthesize   user_id;
@synthesize   emoticon;
@synthesize   currency;
@synthesize   status;
@synthesize   place_of_birth;
@synthesize   active;             // 1
@synthesize   created_at;         //"2016-03-18 10:46:35"
@synthesize   dob;                //"0000-00-00
@synthesize   phone_no;
@synthesize   residence;
@synthesize   registration_type;  // "extended"
@synthesize   level;              // "user"
@synthesize   city;
@synthesize   updated_at;         // "2016-03-18 10:50:42"
@synthesize   lname;
@synthesize   nickname;
@synthesize   email;
@synthesize   fname;
@synthesize   country;



+(instancetype)standardUserInfo
{
    static UserInfo *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        singleton = [[UserInfo alloc] init];
    });
    return singleton;
}

-(id) init
{
    self = [super init];
    
    if (self)
    {
        if ([self readUserInfo] == false)
        {
            user_id = nil;
        }
        
    }
    
    return self;
}


-(void)getUserInfoFromDictionary:(NSDictionary *)dic
{
    user_id = [dic valueForKey:@"id"];
    emoticon = [dic valueForKey:@"emoticon"];
    currency = [dic valueForKey:@"currency"];
    status = [dic valueForKey:@"status"];
    place_of_birth = [dic valueForKey:@"place_of_birth"];
    active = [dic valueForKey:@"active"];
    created_at = [dic valueForKey:@"created_at"];
    dob = [dic valueForKey:@"dob"];
    phone_no = [dic valueForKey:@"phone_no"];
    residence = [dic valueForKey:@"residence"];
    registration_type = [dic valueForKey:@"registration_type"];
    level = [dic valueForKey:@"level"];
    city = [dic valueForKey:@"city"];
    updated_at = [dic valueForKey:@"updated_at"];
    lname = [dic valueForKey:@"lname"];
    nickname = [dic valueForKey:@"nickname"];
    email = [dic valueForKey:@"email"];
    fname = [dic valueForKey:@"fname"];
    country = [dic valueForKey:@"country"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:user_id forKey:@"user_id"];
    [userDefaults setObject:emoticon forKey:@"emoticon"];
//    [userDefaults setObject:currency forKey:@"currency"];
    [userDefaults setObject:status forKey:@"status"];
    [userDefaults setObject:place_of_birth forKey:@"place_of_birth"];
    [userDefaults setObject:active forKey:@"active"];
    [userDefaults setValue:created_at forKey:@"created_at"];
    [userDefaults setObject:dob forKey:@"dob"];
    [userDefaults setObject:phone_no forKey:@"phone_no"];
    [userDefaults setObject:residence forKey:@"residence"];
    [userDefaults setObject:registration_type forKey:@"registration_type"];
    [userDefaults setObject:level forKey:@"level"];
    [userDefaults setObject:city forKey:@"city"];
    [userDefaults setObject:updated_at forKey:@"updated_at"];
    [userDefaults setObject:lname forKey:@"lname"];
    [userDefaults setObject:nickname forKey:@"nickname"];
    [userDefaults setObject:email forKey:@"email"];
    [userDefaults setObject:fname forKey:@"fname"];
    [userDefaults setObject:country forKey:@"country"];
    
}

-(BOOL)readUserInfo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    user_id = [userDefaults valueForKey:@"user_id"];
    if (user_id < 0 || user_id == nil) return false;
    
    emoticon = [userDefaults valueForKey:@"emoticon"];
    //    [userDefaults setObject:currency forKey:@"currency"];
    status = [userDefaults valueForKey:@"status"];
    place_of_birth = [userDefaults valueForKey:@"place_of_birth"];
    active = [userDefaults valueForKey:@"active"];
    created_at = [userDefaults valueForKey:@"created_at"];
    dob = [userDefaults valueForKey:@"dob"];
    phone_no = [userDefaults valueForKey:@"phone_no"];
    residence = [userDefaults valueForKey:@"residence"];
    registration_type = [userDefaults valueForKey:@"registration_type"];
    level = [userDefaults valueForKey:@"level"];
    city = [userDefaults valueForKey:@"city"];
    updated_at = [userDefaults valueForKey:@"updated_at"];
    lname = [userDefaults valueForKey:@"lname"];
    nickname = [userDefaults valueForKey:@"nickname"];
    email = [userDefaults valueForKey:@"email"];
    fname = [userDefaults valueForKey:@"fname"];
    country = [userDefaults valueForKey:@"country"];

    return true;
}

@end
