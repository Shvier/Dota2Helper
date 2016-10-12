//
//  YTDownloadDefine.h
//  YouTuEngineMediaPlayer
//
//  Created by 周娜 on 16/3/29.
//  Copyright © 2016年 Youku Inc. All rights reserved.
//

#ifndef YTDownloadDefine_h
#define YTDownloadDefine_h

#endif /* YTDownloadDefine_h */

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

typedef enum {
    YTDownloadError_NOError,
    YTDownloadError_InvalidVideoId,  //无效视频id
    YTDownloadError_ClientInvalid,   //无效client
    YTDownloadError_PasswordError,   //加密视频
    YTDownloadError_NOURL,
    YTDownloadError_ExistSame,       //添加下载任务的时候，发现此任务已经在队列中
    YTDownloadError_URLInvalid,      //url失效
    YTDownloadError_TSArryEmpty,     //无ts数据
    YTDownloadError_DownloadError,   //下载错误
    YTDownloadError_NetWorkError,    //无网络
    YTDownloadError_NetWorkChange,   //网络连接发生变化,由gprs TO wifi,或者由wifi To gprs
    YTDownloadError_NOFreeSpace,     //无剩余空间了
    YTDownloadError_DisabledDownload,//禁止下载错误
    YTDownloadError_InvalidVideo,    //视频不存在
    YTDownloadError_NetWorkBad,      //网络糟糕或者网络不连通
    YTDownloadError_Interrupted,     //app退出
    YTDownloadError_SessionInvalid,
} YTDownloadError;

//视频下载状态（对应数据库字段state）
typedef NS_ENUM(NSInteger, VideoState) {
    kVideoStateNormal = 1,
    kVideoStatePause,
    kVideoStateWait,
    kVideoStateDownload,
    kVideoStateFailed,
    kVideoStateError,
};

