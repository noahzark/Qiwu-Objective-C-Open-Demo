//
//  RMQWNetWorkManager.h
//  CentAssist
//
//  Created by MacMiniFirst on 15/05/2018.
//  Copyright © 2018 CentaursTech. All rights reserved.
//

#import "AFHTTPSessionManager.h"

//请求成功回调block
typedef void(^requestSuccessBlock)(id response);

//请求失败回调block
typedef void(^requestFailureBlock)(NSError *error);

typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD,
}HTTPMethod;

@interface RMQWNetWorkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)requestWithMethod:(HTTPMethod)method
                 withPath:(NSString*)path
               withParams:(NSDictionary*)params
         withSuccessBlock:(requestSuccessBlock)success
         withFailureBlock:(requestFailureBlock)failure;

@end
