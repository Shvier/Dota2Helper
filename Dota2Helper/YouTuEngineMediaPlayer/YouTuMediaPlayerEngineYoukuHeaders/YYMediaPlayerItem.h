//
//  YYMediaPlayerItem.h
//  YoukuMediaPlayer
//
//  Created by weixinghua on 13-8-9.
//  Copyright (c) 2013年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * videoUrls 字典中的对象数组需要实现的协议，用以保存单个切片的地址和其他信息
 */
@protocol YYMediaPlayerUrlItem <NSObject>

@required

@property (nonatomic, copy) NSString *url;
@property (nonatomic) NSInteger itemid;
@property (nonatomic) double seconds;

@optional

@property (nonatomic) NSInteger size;

@end


/**
 * videoPoints 数组中的对象需要实现的协议，用以保存一个精彩点的相关信息
 */
@protocol YYMediaPlayerVideoPointItem <NSObject>

@property (nonatomic, assign) float start;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *desc;

@end


/**
 *
 */
@protocol YYMediaPlayerItem <NSObject>

@required

@property (nonatomic, retain)   NSMutableDictionary     *videoUrls;		// 保存<清晰度, urlArray>键值对，其中urlArray为该清晰度对应的视频地址数组, 由实现了 YYMediaPlayerUrlItem 的对象组成。
@property (nonatomic, copy)     NSString                *videoid;

@optional

@property (nonatomic,assign)    NSInteger               panorama;       // 是否为全景视频, 1 为是
@property (nonatomic, assign)   int                     totalseconds;   // 视频总时长
@property (nonatomic, copy)     NSString                *image;         // 视频详情图片
@property (nonatomic, copy)     NSString                *nextVid;       // 下一个视频 vid
@property (nonatomic, retain)   NSMutableArray          *videoPoints;   // 打点信息
@property (nonatomic, retain)   NSMutableArray          *languages;     // 语言信息, 请参考接口返回的 audiolang 字段的内容格式
@property (nonatomic, assign)   int                     show_videoseq;  // 视频所处的剧集位置
@property (nonatomic, copy)     NSString                *title;         // 视频标题
@property (nonatomic, copy)     NSString                *showid;
@property (nonatomic, copy)     NSString                *weburl;
@property (nonatomic, retain)   id<YYMediaPlayerItem>   nextPlayItem;
@property (nonatomic, copy)     NSString                *nextTitle;
@property (nonatomic)           int                     nextShowSeq;
@property (nonatomic)           int                     showLogo;       // 1:不显示水印  0:显示水印
@property (nonatomic)           int                     videoStreamType; //1:竖屏视频   0:横屏视频

@end
