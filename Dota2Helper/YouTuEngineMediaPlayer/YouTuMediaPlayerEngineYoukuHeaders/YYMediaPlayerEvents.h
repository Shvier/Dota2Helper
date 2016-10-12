//
//  YYMediaPlayerEvents.h
//  YoukuMediaPlayer
//
//  Created by weixinghua on 13-7-17.
//  Copyright (c) 2013年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYMediaPlayer.h"

@class YYMediaPlayerHistory;


@protocol YYMediaPlayerEvents <NSObject>

@property (nonatomic, assign) YYMediaPlayer *player;

@optional
- (YYMediaPlayerHistory *)playHistory:(NSString *)vid;             // 指定vid视频的播放历史信息

- (void)preload;											// 预加载, 在请求视频信息之前调用
- (void)willPlay;											// 即将播放视频, 此时已获取到视频信息，即将准备播放器
- (void)startPlay;											// 开始播放视频
- (void)endPlayCode:(YYErrorCode)err;						// 该错误事件将导致视频无法继续播放
- (void)playAdError:(YYErrorCode)err;						// 广告播放出错, 这类错误可能不会导致播放中断

- (void)startAd:(YYPlayerShowType)adType;							// 视频广告开始播放
- (void)endAd:(YYPlayerShowType)adType;								// 视频广告结束播放
- (void)switchAd:(int)adIndex cuf:(int)cuf;                 // 视频广告切换, adIndex 为当前播放为即将第几个视频广告
- (void)startInterActiveAd;                                 // 开始互动视频广告
- (void)endInterActiveAd;                                   // 结束互动视频广告
- (void)interActiveAdShowSucess:(UIView *)interActiveView;  // 互动广告展示成功，返回一个互动广告的view
- (void)interActiveAdShowFail;                              // 互动广告展示失败
- (void)interActiveAdPushOn;                                // 互动广告 - 展开
- (void)interActiveAdPushOff;                               // 互动广告 - 缩回

- (void)interactValue:(NSInteger)value;                     // 互动卡片参数

- (void)trueViewAdVid:(NSString *)vid;
- (void)trueViewDetailCuf:(NSInteger)cuf withCuu:(NSString *)cuu andCum:(NSArray *)cum; // 了解详情
- (void)trueViewSkipVipAd;                                  // 跳过广告-打开会员页
- (void)trueViewSkipAd;                                     // tureview跳过广告
- (void)trueViewAdCu:(NSString *)cu withImp:(NSArray *)imp andVid:(NSString *)vid;  // tureview 进入官网
- (void)trueViewClickedSmallScreen;

- (void)adCutdown:(NSTimeInterval)counter;					// 广告倒计时

- (void)startVideo;											// 开始播放正片
- (void)endVideo;											// 结束播放正片

- (void)startPend;											// 开始加载, 开始加载时刻播放器会暂停播放
- (void)endPend;											// 结束加载, 结束加载时刻播放器恢复播放

- (void)startPause;											// 开始暂停
- (void)endPause;											// 结束暂停

- (void)rateChanged:(float)rate;                            // 播放速率发生改变, rate＝0 时表示播放暂时停止, rate=1 时表示以正常速率播放

- (void)startSeek:(NSTimeInterval)time;                     // seek开始
- (void)seekTo:(NSTimeInterval)time;                        // seek点更新
- (void)endSeek:(NSTimeInterval)time isEnd:(BOOL)end;       // 最终确定的 seek 位置, end=YES表示已经seek到视频结束

- (void)durationAvailable:(NSTimeInterval)time;             // 视频总时长可以获取
- (void)played:(NSTimeInterval)time;                        // 当前已播放的时间点
- (void)playable:(NSTimeInterval)time;                      // 当前已缓存的时间点

- (void)appResign;											// app 进入后台
- (void)appActive;											// app 激活

- (void)headsetPluggedIn;                                   // 耳机插入
- (void)headsetUnPlugged;                                   // 耳机拔出

- (void)networkSlow;										// 网速慢
- (void)networkSpeed:(int)speed;							// 当前网速

- (void)videoWillChange;									// 即将切换视频
- (void)videoDidChange;										// 切换视频完成

- (void)qualityWillChange:(NSString*)quality;			// 即将切换清晰度
- (void)qualityDidChange:(NSString*)quality;			// 切换清晰度完成
- (void)qualityFailChange:(NSString*)quality;           // 清晰度切换失败

- (void)languageWillChange:(NSString*)langcode;				// 即将切换语言
- (void)languageDidChange:(NSString*)langcode;				// 切换语言完成

- (void)screenWillChange:(BOOL)fullscreen;					// 即将切换大小屏
- (void)screenDidChange:(BOOL)fullscreen;					// 切换大小屏完成
- (void)layout:(BOOL)fullscreen;							// 播放器界面需要layout, 可以把控件的布局写在该方法中，播放界面需要重新布局时回调该方法

- (void)preparePlayFreeFlowVideo:(BOOL)isFreeFlow;          //是否进行免流量播放,isFreeFlow等于YES进行免流量播放.

- (NSString *)needPassword:(NSString *)vid;                 // 该视频已加密, 需要密码; 返回正确的密码后视频继续播放

- (void)picAdWillRequest:(YYADType)adType;                  // 图片广告即将请求广告内容, 此时iPad需要禁用手势(YYADType == YYADTypePreImage)时禁用
- (void)picAdWillShowDetail:(YYADType)adType;               // 图片广告点击展示详情, 如第三方广告跳转内部webview
- (void)picAdWillAppear:(YYADType)adType;                   // 图片广告即将显示
- (void)picAdWillDisAppear:(YYADType)adType;                // 图片广告即将关闭

- (void)questionnaireOnClicked:(NSString *)url;             // 调查问卷点击
- (void)adDetailOnclicked:(NSString *)url cuf:(int)cuf adType:(YYADType)type;       // 广告详情点击

- (void)airPlayAvailable;                                   // 环境中存在可用的 AirPlay 设备, 设备列表可从 YYMediaPlayer 的 deviceList 中获得
- (void)airPlayNeedPassword;                                // AirPlay 需要配对密码, 输入密码后调用 YYMediaPlayer 的 sendDevicePassword 方法

- (void)airPlayStartConnecting;                             // airplay开始连接
- (void)airPlayStartPlaying;                                // airplay开始播放
- (void)airPlayEndPlaying;                                  // airplay结束播放
- (void)airPlayError;                                       // airplay播放发生错误
- (void)airPlayPwdError;                                    // airplay密码或验证错误

- (void)liveBarrageidAvailable;                             // 直播获取channelid成功
- (YYLiveBarrageSwitch)liveBarrageSwitch;                   // 获取弹幕开关
- (YYLiveBarrageDensity)liveBarrageDensity;                 // 获取弹幕密集度

- (void)spheer3DVideoAvailavle:(BOOL)spheerMode;            // 判断是否为3D全景视频

// 播放器界面所获取的触摸事件
- (void)playerViewTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)playerViewTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)playerViewTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)playerViewTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
