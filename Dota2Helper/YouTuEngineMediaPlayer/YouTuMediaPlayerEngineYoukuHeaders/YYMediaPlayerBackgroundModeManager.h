//
//  YYMediaPlayerBackgroundModeManager.h
//  YoukuMediaPlayer
//
//  Created by kevin on 14-9-5.
//  Copyright (c) 2014年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYMediaPlayerBackgroundModeManager : NSObject

@property (nonatomic, readonly, getter = isSupportBackgroundMode) BOOL supportBackgroundMode;

+ (YYMediaPlayerBackgroundModeManager *)shareInstance;

- (void)beginBackgroundMode;

- (void)endBackgroundMode;

@end
