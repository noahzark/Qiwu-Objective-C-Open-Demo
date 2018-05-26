//
//  NSDictionary+RMQW.m
//  AFNetworkDemo
//
//  Created by MacMiniFirst on 25/05/2018.
//  Copyright © 2018 CentaursTech. All rights reserved.
//


#import "NSDictionary+RMQW.h"
#import "NSString+RMQW.h"

static const NSString *kRobotAppKey = @"cenri-ios-demo";
static const NSString *kRobotAppSecrect = @"7d530b9597744de1d479b4e222b8260d";

static const NSString *kKey_appKey = @"appkey";
static const NSString *kKey_timeStamp = @"timestamp";
static const NSString *kKey_uid = @"uid";
static const NSString *kKey_verify = @"verify";
static const NSString *kKey_nickName = @"nickname";
static const NSString *kKey_lang = @"lang";

@implementation NSDictionary (RMQW)

+ (NSMutableDictionary*)rmqw_requestBasicParameters {
    
    NSString *timestamp = [NSString rmqw_currentTimeStr]; //时间戳
    NSString *uuid = [NSString rmqw_readUUIDFromKeyChain];//设备唯一标识符
    NSString *nickName = @"liyunfeng-ios";
    NSString *verify  = [NSString stringWithFormat:@"%@%@%@",kRobotAppSecrect, uuid, timestamp];
    NSString *verifyMD5 = [verify rmqw_md5];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[kKey_appKey] = (NSString*)kRobotAppKey;
    params[kKey_timeStamp] = timestamp;
    params[kKey_uid] = uuid;
    params[kKey_verify] = verifyMD5;
    params[kKey_nickName] = nickName;
    params[kKey_lang] = @"";
    
    NSLog(@"params::%@",params);
    
    return params;
}

@end
