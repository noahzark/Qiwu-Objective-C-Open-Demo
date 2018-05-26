//
//  RMQWNetWorkManager.m
//  CentAssist
//
//  Created by MacMiniFirst on 15/05/2018.
//  Copyright © 2018 CentaursTech. All rights reserved.
//

#define RMQW_BaseURLString   @"https://robot-service.centaurstech.com/api/"

#import "RMQWNetWorkManager.h"

static const NSInteger  kRMQWNetWorkTimout = 30.0; //网络请求超时时间
static const NSString*  kRMQWBaseURLString =  @"https://robot-service.centaurstech.com/api/";

@implementation RMQWNetWorkManager

+ (instancetype)sharedManager {
    
    static RMQWNetWorkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:(NSString*)kRMQWBaseURLString]];
    });
    return manager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = kRMQWNetWorkTimout;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/javascript",@"text/json",@"text/html", nil];
    }
    return self;
}


- (void)requestWithMethod:(HTTPMethod)method
                 withPath:(NSString *)path
               withParams:(NSDictionary *)params
         withSuccessBlock:(requestSuccessBlock)success
         withFailureBlock:(requestFailureBlock)failure {
    
    path = [RMQW_BaseURLString stringByAppendingString:[NSString stringWithFormat:@"%@",path]];
    NSLog(@"path::%@",path);
    
    switch (method) {
        case GET:{
            [self GET:path
           parameters:params
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSLog(@"JSON:%@",responseObject);
                  success(responseObject);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  NSLog(@"Error: %@", error);
                  failure(error);
              }];
        }
            break;
            
        case POST:
        {
            [self POST:path
            parameters:params
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   NSLog(@"afnetworking JSON:%@",responseObject);
                   success(responseObject);
               }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   NSLog(@"afnetworking Error: %@", error);
                   failure(error);
               }];
        }
            break;

        default:
            break;
    }
    
}

@end
