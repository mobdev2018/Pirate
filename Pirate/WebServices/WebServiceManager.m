//
//  WebServiceManager.m
//  Pirate
//
//  Created by beauty on 3/16/16.
//  Copyright © 2016 beauty. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+(instancetype)sharedInstance
{
    static WebServiceManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        singleton = [[WebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://developer.rabieb.dd-c.com/api/v1/"]];
    });
    return singleton;
}

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        
    }
    return self;
}



-(void)registerUserWithData:(NSDictionary*)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self POST:@"users" parameters:userData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
}

-(void)extendedRegisterUserWithData:(NSDictionary *)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self POST:@"users?reg_type=extended" parameters:userData progress:nil success:^(NSURLSessionDataTask *task, id responseObject){
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task,NSError *error){
        errorBlock(error);
    }];
}

-(void)verificationUserWithData:(NSDictionary *)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self POST:@"users/verification_code/verify" parameters:userData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)loginUserWithData:(NSDictionary *)userData completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self POST:@"auth/login" parameters:userData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)resendingVerificationCodeWithCompletionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self GET:@"users/verification_code/get" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)logout:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self GET:@"auth/logout" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}


-(void)getAnalysisWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    NSString *strUrl = [NSString stringWithFormat:@"users/%d/graphs/ratings/self_to_others", user_id];
    [self GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)getCharactersWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    NSString *strUrl = [NSString stringWithFormat:@"users/%d/ratings", user_id];
    [self GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)getRatersWithId:(int)user_id completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    NSString *strUrl = [NSString stringWithFormat:@"users/%d/raters", user_id];
    [self GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)getFriends:(int)user_id parameters:(NSDictionary*)params completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    NSString *strUrl = [NSString stringWithFormat:@"users/%d/Connections", user_id];
    [self GET:strUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)getConnectionSuggestions:(NSString*)strUrl completionHander:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    //NSString *strUrl = @"connection/suggestions/?page=2";
    [self GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}


-(void)sendFriendRequestWithConnection:(int)connection completionHander:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    NSDictionary *param = @{@"connection": [NSNumber numberWithInt:connection]};
    [self POST:@"connection/request" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
