//
//  WXAFNetWorking.m
//  WXDataRequestManager
//
//  Created by dang on 2017/2/24.
//  Copyright © 2017年 walle. All rights reserved.
//

#import "WXAFNetWorking.h"

#import <AFNetworking/AFNetworking.h>

@implementation WXAFNetWorking

- (instancetype)init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}

+ (instancetype)shareAFNetWorking
{
    static WXAFNetWorking *afn = nil;
    static dispatch_once_t onceToken = nil;
    dispatch_once(&onceToken, ^{
        afn = [[WXAFNetWorking alloc]init];
    });
    return afn;
}

// Data Task

+ (void)createDataTaskWithBaseUrl:(NSString *)baseUrl andAction:(NSString *)action andParameters:(NSDictionary *)parameters andMethod:(MethodType)methodType andRequestSerialization:(SerializationType)requestSerializationType andResponseSerialization:(SerializationType)responseSerializationType andSessionConfiguration:(SessionConfigurationType)sessionConfigurationType andBackgroundSessionConfigurationWithIdentifier:(NSString *)backgroundSessionConfigurationWithIdentifier
{
    NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationType:sessionConfigurationType andBackgroundSessionConfigurationWithIdentifier:backgroundSessionConfigurationWithIdentifier];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:sessionConfiguration];

    NSMutableURLRequest *requstML = [AFHTTPRequestSerializer serializer] requestWithMethod:[self requestMethod:methodType] URLString:<#(nonnull NSString *)#> parameters:<#(nullable id)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>



}

+ (NSMutableURLRequest *)


/**
 获取请求类型

 @param methodType 请求方法类型
 @return 请求类型
 */
+ (NSString *)requestMethod:(MethodType)methodType
{
    switch (methodType)
    {
        case POST:
        {
            return @"POST";
        }
            break;

        case GET:
        {
            return @"GET";
        }
            break;

        default:
        {
            return nil;
        }
            break;
    }
}



/**
 获取会话配置对象

 @param sessionConfigurationType 会话类型
 @param backgroundSessionConfigurationWithIdentifier 会话后台模式标识
 @return 会话配置对象
 */
+ (NSURLSessionConfiguration *)sessionConfigurationType:(SessionConfigurationType)sessionConfigurationType andBackgroundSessionConfigurationWithIdentifier:(NSString *)backgroundSessionConfigurationWithIdentifier
{
    switch (sessionConfigurationType)
    {
        case DEFAULT:
        {
            return [NSURLSessionConfiguration defaultSessionConfiguration];
        }
            break;

        case EPHEMERAL:
        {
            return [NSURLSessionConfiguration  ephemeralSessionConfiguration];
        }
            break;

        case BACKGROUND:
        {
            return [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:backgroundSessionConfigurationWithIdentifier];
        }
            break;

        default:
        {
            return nil;
        }
            break;
    }
}

@end
