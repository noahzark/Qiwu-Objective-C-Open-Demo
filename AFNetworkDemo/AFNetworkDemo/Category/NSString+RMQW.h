//
//  NSString+RMQW.h
//  CentAssist
//
//  Created by MacMiniFirst on 15/05/2018.
//  Copyright © 2018 CentaursTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RMQW)

//获取当前时间
+ (NSString *)rmqw_currentDateStr;

//获取当前时间戳
+ (NSString *)rmqw_currentTimeStr;

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSString *)rmqw_getDateStringWithTimeStr:(NSString *)str;

//字符串转时间戳 如：2017-4-10 17:15:10
+ (NSString *)rmqw_getTimeStrWithString:(NSString *)str;

- (NSString *)rmqw_md5;

+(void)rmqw_saveUUIDToKeyChain;

+(NSString *)rmqw_readUUIDFromKeyChain;

+ (NSString *)rmqw_getUUIDString;

+ (NSString *)rmqw_getCachePath;

/**
 解析JSON数据
 ****/
+ (NSString *)stringFromJson:(NSString*)params;//

@end
