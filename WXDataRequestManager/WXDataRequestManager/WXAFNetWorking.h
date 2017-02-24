//
//  WXAFNetWorking.h
//  WXDataRequestManager
//
//  Created by dang on 2017/2/24.
//  Copyright © 2017年 walle. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求结果回调

typedef void(^CompletionHandler)(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error);

//上传进度回调

typedef void(^UploadProgress)(NSProgress * _Nonnull uploadProgress);

//下载进度

typedef void(^DownloadProgress)(NSProgress * _Nonnull downloadProgress);

//请求类型
typedef NS_ENUM(NSUInteger, MethodType)
{
    POST,
    GET,
};

//序列类型
typedef NS_ENUM(NSUInteger, SerializationType)
{
    HTTP,
    JSON,
    XML,
    IMAGE,
};

//会话类型
typedef NS_ENUM(NSUInteger, SessionConfigurationType)
{
    DEFAULT,
    EPHEMERAL,
    BACKGROUND,
};


@interface WXAFNetWorking : NSObject

@end

