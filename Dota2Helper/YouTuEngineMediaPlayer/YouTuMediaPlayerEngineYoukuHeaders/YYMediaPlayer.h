//
//  YYMediaPlayer.h
//  YoukuMediaPlayer
//
//  Created by weixinghua on 13-6-24.
//  Copyright (c) 2013年 Youku Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYMediaPlayerDefines.h"

YY_EXTERN NSString *const kYYVideoQualityFLV;		// 标清
YY_EXTERN NSString *const kYYVideoQualityMP4;		// 高清
YY_EXTERN NSString *const kYYVideoQualityHD2;		// 超清

typedef NS_ENUM(NSInteger, YYADType) {  // 播放器广告类型
    YYADTypePreImage        = 12,           // 前贴图片广告
    YYADTypePreVideo        = 70,			// 前贴视频广告
    YYAdTypeMidVideoAd      = 80,           // 中插视频广告
    YYADTypePostVideo       = 71,			// 后贴视频广告
    YYADTypePauseImage      = 73,			// 暂停图片广告
    YYADTypeCorner          = 74,           // 脚标广告
    YYAdTypeQuestionnaire   = 100,          // 调查问卷
};

typedef NS_ENUM(NSInteger, YYPlayerShowType) {
    YYPlayerShowTypeNotReady    = -1,           // 播放器未准备好
    
    YYPlayerShowTypeVideo       = 0,            // 播放器播放正片
    
    YYPlayerShowTypePreImageAd  = 12,           // 播放器显示前贴图片广告
    
    YYPlayerShowTypePreVideoAd  = 70,           // 播放器显示前贴视频广告
    
    YYPlayerShowTypeMidVideoAd =  80,           // 播放器显示中插广告
    
    YYPlayerShowTypePostVideoAd = 71,           // 播放器显示后贴视频广告
};

typedef NS_ENUM(NSInteger, YYErrorCode) {
    YYNoError               = 0,        // 正在播放中, 未出错
    
    /*--------------------------- 播放行为相关错误 ----------------------------*/
    YYPlayCompleted       	= 100,      // 视频正常播放结束
    YYPlayCanceled 			= 101,		// 用户主动取消播放
    YYLookTimeOver          = 102,      // 按时长试看，试看结束
    YYLookEpisodeOver       = 103,      // 按集数试看，试看结束
    YYLivePlayStop          = 104,      // 客户端登陆后主动停止直播进行刷新
    
    YYPlayError             = 1002,     // 播放器错误
    YYNetworkDisconnected   = 1005,     // 网络出错超过30s, 可视为网络断开
    YYNetworkError          = 1008,     // 视频播放点不能前进超过20s, 可视为网络超时或网速太差
    YYDataSourceError       = 1006,     // 媒体文件错误
    YYPrepareError          = 1007,     // 广告或正片播放器准备出错
    YYSeekError             = 1009,     // Seek 错误
    
    /*--------------------------- 请求视频详情相关错误 ----------------------------*/
    YYErrorServerNotAnswer  = 400,      // 服务器未应答, 获取视频详情失败
    
    YYPlayPassiveStop       = 10000,    // 被动停止播放消息
    
    // 获取视频详情成功, 但不能播放的相关错误码
    YYSeverError            = -100,     // 服务器‘其他错误’，提示语：连接服务器异常，请您观看其他视频。
    YYErrorForbiddenOrigin  = -101,     // 禁止海外播放，提示语：Pad-----Sorry, this video can only be streamed within \
    // Mainland China.Phone-----抱歉，该视频只在中国大陆播放，请您观看其他视频。
    YYErrorOnlyForFriends   = -102,     // 仅对好友开放，提示语：该视频仅对好友公开，去优酷网加TA为好友吧。
    YYErrorCopyrightLimited = -104,     // 版权受限制，提示语：Pad-----该视频暂不支持优酷HD，请点击进入优酷网观看。\
    //Phone-----该视频暂无优酷客户端版权，请您点击进入优酷网观看。
    YYErrorPrivate          = -105,     // 视频已加密，提示语：该视频已加密，暂无法播放，请您观看其他视频。
    YYErrorNotExist         = -106,      // 视频不存在或无效，提示语：抱歉，该视频内容不存在或无效，请您观看其他视频。
    
    YYErrorInvalidPassWord  = -107,      // 输入的密码错误
    
    YYErrorCodeNoCopyright  = -108,      // 无版权
    
    YYErrorInvalidClient    = -109,      // client无效或sdk版本过低
    
    YYErrorClientFormat     = -110,      // client_id或client_secret格式错误
    
    YYErrorPermissionDeny   = -111,      // 视频无权限播放

    YYErrorOnlyForVIP       = -112,      // 优酷会员专享
    
    YYErrorInitOpenView     = -113,      // 初始化界面无效
    
    YYErrorUrlNotFound      = -202,      // 当前视频的所有播放格式都没有找到
    
    YYErrorLiveVideoStateLimit           = 10,     // 直播视频相关状态限定
    YYErrorLiveVideoStateNotReady        = 20     // 直播还未准备好
};
typedef NS_ENUM (NSInteger, YYLiveVideoStateLimit) {
    YYLiveVideoStateLimitUnkonwn         = -1, //未知状态
    YYLiveVideoStateLimitNone            =  0, //无限定条件
    YYLiveVideoStateLimitForbiddenOrigin = -8, // Sorry, this video can only be streamed within Mainland China.Phone—–抱歉，该视频只在中国大陆播放，请您观看其他视频。（需播放器配合）
    YYLiveVideoStateLimitPurchase       = -12, //本节目是付费节目，如未购买或已到期，请先\n购买 已购买用户请:登录
    YYLiveVideoStateLimitLogin          = -13, //观看此节目，请先登录
    YYLiveVideoStateLimitView           = -14, //您已超出该付费视频每天的观看次数上限！\n如您的账号被盗用，请及时与客服联系！
    YYLiveVideoStateLimitiPad           = -15, //很抱歉！该视频的格式暂时不支持在ipad平台上的播放。
    YYLiveVideoStateLimitUnkonwn0       = -16, //未知限定
    YYLiveVideoStateLimitPreSell        = -17, //本节目预售中
    YYLiveVideoStateLimitReserved       = -18, //预订成功
    YYLiveVideoStateLimitWillPreSell    = -19, //预售即将开始
    YYLiveVideoStateLimitCopyRight      = -20, //非常抱歉，因版权限制，该视频当前无法播放
    YYLiveVideoStateLimitNotPay         = -21, //尚未购买节目，请先到节目页完成购买。谢谢！
    YYLiveVideoStateLimitParams         = -22, //拂晓播放器请求，参数验证不通过
    YYLiveVideoStateLimitUnkonwn1       = -23, //未知限定
    YYLiveVideoStateLimitUnkonwn2       = -24, //未知限定
    YYLiveVideoStateLimitAccount        = -25, //您的账号分享不合法，超过了IP上限！如您的账号被盗用，请及时与客服联系!
    YYLiveVideoStateLimitVideo          = -26, //抱歉，无法观看此视频!
    YYLiveVideoStateLimitOnlyForVIP     = -27, //此直播仅会员可以观看
};
typedef NS_ENUM (NSInteger, YYLiveVideoState) {
    YYLiveVideoStateNotBegin    = 0,    // 直播尚未开始
    YYliveVideoStateIsLiving    = 1,    // 直播正在进行中
    YYLiveVideOStateDidFinish   = -1,   // 直播已结束
    YYLiveVideoStateUnkonwn     = -2,   // unknown
};
typedef NS_ENUM (NSInteger, YYLiveBarrageDensity) {
    YYLiveBarrageDensityComfort,
    YYLiveBarrageDensityConcentrate,
};
typedef NS_ENUM (NSInteger, YYLiveBarrageSwitch) {
    YYLiveBarrageSwitchOn,
    YYLiveBarrageSwitchOff,
};

typedef NS_ENUM(NSInteger, YYVideoGravity) {
    YYVideoGravityResize,           // 该参数指定播放画面填满整个播放器的view.
    YYVideoGravityAspect,           // 播放画面保持视频原始比例和原始大小.
    YYVideoGravityResizeAspect,     // 播放画面保持原始比例, 并拉伸到适应屏幕. 该模式为“默认模式”.
    YYVideoGravityResizeAspectFill  // 播放画面保持原始比例, 并拉伸到填满整个屏幕.
};

typedef NS_ENUM(NSInteger, YYAppType) { // 指定当前的前端 App 类型, 默认为优酷iPhone版
    YYAppTypeYoukuiPhone,
    YYAppTypeYoukuiPad,
};

typedef NS_ENUM(NSInteger, YYBuildType) {
    YYBuildDebug = 100,
    YYBuildDebug2,
    YYBuildRelease,
};

typedef NS_ENUM(NSInteger, YYInterActiveAdType) {   //互动广告状态
    YYInterActiveAdTypeRequest = 300,            //互动广告请求
    YYInterActiveAdTypeShow    = 301,            //互动广告展示
    YYInterActiveAdTypeHide    = 302,            //互动广告隐藏
    YYInterActiveAdTypePushON  = 303,            //互动广告滑出
    YYInterActiveAdTypePushOFF = 304,            //互动广告滑入
    YYInterActiveAdTypeClose   = 305,            //互动广告关闭
};

typedef NS_ENUM(NSInteger, YYDecodingSchemeType) {
    YYDecodingSchemeSoftWareType = 0,
    YYDecodingSchemeHardWareType
};

@protocol YYMediaPlayerItem;
@protocol YYMediaPlayerNetworkParamsDelegate;
@class YYAdUrlItemInfo;
@class YTEngineOpenViewManager;

@interface YYMediaPlayer : NSObject {
    
}

@property (nonatomic) YYAppType appType;                                            // 前端APP类型,默认为YYAppTypeYoukuiPhone

@property (nonatomic, assign) UIViewController *controller;							// 播放器所在的 UIViewController, 需要指定
@property (nonatomic, assign) id<YYMediaPlayerNetworkParamsDelegate> paramsDelegate;           // 网络参数委托, 需指定，若未来参数由统计SDK提供，则不再作为公开属性

@property (nonatomic, getter = isAutoSkipHead) BOOL autoSkipHead;                   // 跳过片头片尾,默认为NO不跳过

@property (nonatomic,assign)    NSInteger               panorama;       // 是否为全景视频, 1 为是

@property (nonatomic) float volume;													// 视频音量大小, 该音量与系统音量不同, 是播放器内的音量
@property (nonatomic, copy) NSString *clientId; // sdk使用标识

@property (nonatomic, copy) NSString *clientSecret; // sdk使用标识

@property (nonatomic, copy) NSString *platform; //播放平台：youku，tudou，cloud

@property (nonatomic) YYBuildType buildType;     // 服务请求地址类型,默认为YYBuildRelease

@property (nonatomic, getter = isMasterLogEnable) BOOL masterLogEnable;            // 是否打开log总开关,默认为NO关闭.

@property (nonatomic, assign) YYDecodingSchemeType decodingScheme;

@property (nonatomic, assign) UIGestureRecognizer *gestureForSpheer3DVideo;        //全景视频模式需要获取手势信息
/**
 * @功能 sdk版本号.
 */
+ (NSString *)version;

/**
 *  反初始化, 退出播放器时请先调用该函数
 */
- (void)deinit;

/**
 * @功能 播放指定id和清晰度的优酷主站视频，
 * @参数 vid:视频id
 * @参数 quality:清晰度，当指定的清晰度不存在时，默认以该视频最低的清晰度来播放
 * @参数 from:播放起始点，当该参数为<=0时，才会回调 YYMediaPlayerEvents 中的 playHistory 历史播放点
 * @参数 password:加密视频的密码，可以为 nil
 * @备注
 */
- (void)playVid:(NSString *)vid
        quality:(NSString*)quality
       password:(NSString *)password
           from:(float)from;

/**
 * @功能 播放指定切片的视频
 * @参数 playItem:保存所有切片的相关信息，包括切片视频地址等信息
 * @参数 quality:清晰度
 * @备注 playItem遵守YKPlayItem协议
 */
- (void)playVideo:(id<YYMediaPlayerItem>)playItem
          quality:(NSString *)quality
             from:(float)from
       oldEncrypt:(BOOL)enable;
@end


@interface YYMediaPlayer (YYMediaPlayerStatus)

@property (nonatomic, readonly) YYErrorCode errorCode;              // 播放出错时的错误码

@property (nonatomic, readonly) YYPlayerShowType playerShowType;    // 当前正在播放的视频类型,若当前未开始播放任何视频,则返回YYPlayerShowTypeNotReady
@property (nonatomic, readonly) NSString *errorDescription;         // 播放出错时接口返回的错误描述

@property (nonatomic, readonly) YYInterActiveAdType interActiveAdType; // 互动广告状态

@end


/* 在获取完视频信息之后, 即 willPlay 回调之后有效 */
@interface YYMediaPlayer (YYMediaPlayerVideoInformations)

@property (nonatomic, retain, readonly) NSString *videoid;       // 视频vid

@property (nonatomic, retain, readonly) NSString *sessionid;     // 播放器周期内的 sessionid

@property (nonatomic, retain, readonly) NSString *showid;        // 视频showid

@property (nonatomic, retain, readonly) NSString *title;         // 视频标题

@property (nonatomic, retain, readonly) NSString *webUrl;        // 视频weburl

@property (nonatomic, retain, readonly) NSString *imageUrl;      // 视频缩略图url

@property (nonatomic, readonly, getter = isPaid) BOOL paid;         //是否付费

@property (nonatomic, retain, readonly) NSArray *payTypes;          //付费类型集合

@property (nonatomic, readonly, getter = isTryWatch) BOOL tryWatch; // 当前视频是否为试看

@property (nonatomic, readonly) NSInteger tryWatchTime;             // 当前视频试看时长

@property (nonatomic, retain, readonly) NSString *tryWatchType;     // 试看类型:不支持试看(cannot) 节目按时长试看(time) 节目按集数试看(episode)

@property (nonatomic, readonly) NSInteger tryWatchSeries;           // 试看集数

@property (nonatomic, retain, readonly) NSString *tryWatchDesc;     // 试看描述信息

@property (nonatomic, readonly) NSInteger videoType;              //正片类型，-1为无效值

@property (nonatomic, readonly) NSInteger videoStreamType;        //1:垂直视频  0:水平视频

@end


@interface YYMediaPlayer (YYMediaPlayerAdvertisement)

@property (nonatomic, readonly) NSInteger cuf;                      // 广告点击详情跳转位置, cuf=1 表示跳转到内置 webview

@property (nonatomic, retain, readonly) NSString *cuu;              // 当CUF=2或3或4时，解析CU中的URL内容，取其中的u，作为新的字段传递给前端

@property (nonatomic, retain, readonly) NSString *adClickDetailUrl;       // 广告点击详情跳转地址

@property (nonatomic, retain, readonly) NSString *questionnaireClickUrl;  // 调查问卷跳转地址

@property (nonatomic, retain, readonly) NSString *adext;                  // 广告参数

/* 外部点击跳转详情时调用该接口, 以实现曝光 */
- (void)adClicked;

@end


@interface YYMediaPlayer (YYMediaPlayerPlaySettingInfos)

@property (nonatomic, readonly) NSInteger sequence;									// 当前视频所在的剧集位置

@property (nonatomic, copy) NSString *quality;								// 清晰度, 当前视频支持的清晰度可以从 qualityArray 获得
@property (nonatomic, readonly) NSArray *qualityArray;						// 当前视频支持的清晰度, 类型为 kYYVideoQualityFLV, kYYVideoQualityMP4, kYYVideoQualityHD2; 分别对应"手机flv", "网站mp4", "网站超清hd2"
@property (nonatomic, readonly) NSDictionary *qualityDict;                  // 当前支持的清晰度字典, 存放形式为 kYYVideoQualityFLV:@"标清" 等

@property (nonatomic, copy) NSString *langcode;                                     // 语言, 当前支持的语言编码可从 languageDict 的 key 获得, 若只有一种语言时, 可能为 nil
@property (nonatomic, readonly) NSDictionary *languageDict;                   // 当前视频支持的语言字典, 存放 "langcode:language" 键值对, 其中 language 为语言的中文名称。所播放的视频没有可选语言时可能为 nil

@property (nonatomic, readonly) NSArray *videoPoints;						// 视频打点信息, 数组元素类型为id<YYVideoPointDelegate>, 若视频无打点信息则该指为 nil

@end


@interface YYMediaPlayer (YYMediaPlayerPlaybackControl)

@property (nonatomic, readonly, getter = isLocalPlay) BOOL localPlay;   // 是否为本地播放

- (void)play;                         // 播放
- (void)pause;                        // 暂停
- (void)stop;                         // 停止
- (void)dpause;                       // 直接暂停，不作为用户行为导致的暂停处理，即不展示暂停广告等

- (BOOL)isPending;                    // 是否正在加载
- (BOOL)isSeeking;                    // 是否正在 seek
- (BOOL)isPlaying;                    // 是否正在正常播放
- (BOOL)isPausingInitiative;          // 是否用户主动暂停播放

- (void)replay;                       // 重试当前播放，若播放出错则从出错点开始重试，若播放结束则从视频起始点开始播放

@end


@interface YYMediaPlayer (YYMediaPlayerTimeControl)

@property (nonatomic, readonly) NSTimeInterval duration;    // 当前视频总时长
@property (nonatomic, readonly) NSTimeInterval played;      // 当前已播放的时间点
@property (nonatomic, readonly) NSTimeInterval playable;    // 当前已缓存的时间点

- (void)beginSeek:(NSTimeInterval)time;             // 开始seek时刻调用此方法，表示seek开始的起始点
- (void)seekTo:(NSTimeInterval)time;                // seek点更新时调用此方法，更新seeking中的实时时刻
- (void)endSeek:(NSTimeInterval)time;               // 最终确定的 seek 位置，seek到该时刻
- (void)seekToEnd;									// seek 到视频最后时刻
- (NSTimeInterval)getCurrentTime;                   //

@end

@interface YYMediaPlayer (YYMediaPlayerViewHierarcy)

@property (nonatomic, getter = isFullscreen) BOOL fullscreen;   // 全屏幕播放, YES为全屏幕播放, NO为原始屏幕大小播放
@property (nonatomic) YYVideoGravity gravity;                // 视频画面显示模式, 默认模式为YYVideoGravityResizeAspect
@property (nonatomic) float scale;                          // 播放画面的缩放比例, 仅当 gravity 为 YYVideoGravityResizeAspect 时, scale 才有意义。

- (UIView *)view;                                       // 播放器 view

- (UIView *)playerView;                                 // 播放画面 view, 该 view 仅为播放画面的视图

- (void)addBarrageView:(UIView *)view;                  // 向播放器添加弹幕 view
- (void)removeBarrageView;

@end


@interface YYMediaPlayer (YYMediaPlayerEvents)

- (void)addEventsObserver:(id)observer;				// 添加播放器事件的一个监听者, 该 observer 需要实现 YYMediaPlayerEvents 的相关方法, 需要注意不能在 YYMediaPlayerEvents 的回调方法中执行该操作
- (void)addEventsObservers:(NSArray *)observers;	// 添加播放器事件的一组监听者, observers 为包含多个监听者的数组, 监听者需要实现 YYPlayerEvents 的相关方法, 需要注意不能在 YYMediaPlayerEvents 的回调方法中执行该操作
- (void)removeEventsObserver:(id)observer;			// 删除播放器事件的监听者 observer, 需要注意的是, 不能在 YYMediaPlayerEvents 的回调方法中执行该操作
- (void)removeEventsObservers:(NSArray *)observers;	// 删除播放器事件的一组监听者, 需要注意不能在 YYMediaPlayerEvents 的回调方法中执行该操作

@end
