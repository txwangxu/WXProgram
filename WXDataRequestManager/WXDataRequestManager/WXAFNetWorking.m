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



/**
 数据网络请求

 @param baseUrl 服务器地址
 @param action 地址路径
 @param parameters 请求参数
 @param methodType 请求方式
 @param requestSerializationType 请求序列
 @param responseSerializationType 响应序列
 @param sessionConfigurationType 会话类型
 @param backgroundSessionConfigurationWithIdentifier 后台模式标识
 @param uploadProgressHandle 上传回调
 @param downloadProgressHandle 下载回调
 @param completionHandle 执行完成回调
 */
+ (void)createDataTaskWithBaseUrl:(NSString *)baseUrl andAction:(NSString *)action andParameters:(NSDictionary *)parameters andMethod:(MethodType)methodType andRequestSerialization:(SerializationType)requestSerializationType andResponseSerialization:(SerializationType)responseSerializationType andSessionConfiguration:(SessionConfigurationType)sessionConfigurationType andBackgroundSessionConfigurationWithIdentifier:(NSString *)backgroundSessionConfigurationWithIdentifier andUploadProgress:(UploadProgress)uploadProgressHandle andDownloadProgress:(DownloadProgress)downloadProgressHandle andCompletionHandler:(CompletionHandler)completionHandle
{
    NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationType:sessionConfigurationType andBackgroundSessionConfigurationWithIdentifier:backgroundSessionConfigurationWithIdentifier];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:sessionConfiguration];
    NSString *urlStr = [baseUrl stringByAppendingString:action];
    NSMutableURLRequest *request =  [self requestWithMethod:methodType andUrlString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] andParameters:parameters andRequestSerialization:requestSerializationType];
    manager.responseSerializer = [self responseSerialization:responseSerializationType];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            uploadProgressHandle(uploadProgress);
        });
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            downloadProgressHandle(downloadProgress);
        });
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandle(response, responseObject, error);
        });
    }];

    [dataTask resume];
}


/**
 网络请求对象

 @param methodType 请求方法
 @param urlString 请求地址
 @param parameters 请求参数
 @param requestSerializationType 请求序列方式
 @return 请求对象
 */
+ (NSMutableURLRequest *)requestWithMethod:(MethodType)methodType andUrlString:(NSString *)urlString andParameters:(NSDictionary *)parameters andRequestSerialization:(SerializationType)requestSerializationType
{
    return [[self requestSerialization:requestSerializationType] requestWithMethod:[self requestMethod:methodType] URLString:urlString parameters:parameters error:nil];
}


/**
 获取网络请求序列方式

 @param requestSerializationType 请求序列类型
 @return 请求序列对象
 */
+ (AFHTTPRequestSerializer *)requestSerialization:(SerializationType)requestSerializationType
{
    switch (requestSerializationType)
    {
        case HTTP:
        {
            return [AFHTTPRequestSerializer serializer];
        }
            break;

        case JSON:
        {
            return [AFJSONRequestSerializer serializer];
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
 获取网络响应序列方式

 @param requestSerializationType 响应序列类型
 @return 响应序列对象
 */
+ (AFHTTPResponseSerializer *)responseSerialization:(SerializationType)responseSerializationType
{
    switch (responseSerializationType)
    {
        case HTTP:
        {
            return [AFHTTPResponseSerializer serializer];
        }
            break;

        case JSON:
        {
            return [AFJSONResponseSerializer serializer];
        }
            break;

        case XML:
        {
            return [AFXMLParserResponseSerializer serializer];
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
