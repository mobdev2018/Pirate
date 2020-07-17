//
//  WebServiceManager.h
//  Pirate
//
//  Created by beauty on 3/16/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "AFNetworking.h"

typedef void (^CompletionBlock)(id obj);
typedef void (^ErrorBlock)(NSError *error);

@interface WebServiceManager : AFHTTPSessionManager
+(instancetype)sharedInstance;

-(void)registerUserWithData:(NSDictionary*)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)extendedRegisterUserWithData:(NSDictionary *)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)verificationUserWithData:(NSDictionary*)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)loginUserWithData:(NSDictionary*)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)resendingVerificationCodeWithCompletionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)logout:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;

-(void)getAnalysisWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)getCharactersWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;
-(void)getRatersWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;




-(void)getFriends:(int)user_id parameters:(NSDictionary*)params completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;

-(void)getConnectionSuggestions:(NSString*)strUrl completionHander:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;

-(void)sendFriendRequestWithConnection:(int)connection completionHander:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock;

@end
