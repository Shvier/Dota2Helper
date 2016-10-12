//
//  YYMediaPlayerHistory.h
//  YoukuMediaPlayer
//
//  Created by kevin on 14-7-16.
//  Copyright (c) 2014年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYMediaPlayer.h"

@interface YYMediaPlayerHistory : NSObject

@property (nonatomic, copy) NSString *vid;               // videoid

@property (nonatomic) NSTimeInterval played;             // 播放历史已播放时刻, 单位秒

@property (nonatomic, copy) NSDate   *lastUpdate;        // 播放历史更新时间

@end
