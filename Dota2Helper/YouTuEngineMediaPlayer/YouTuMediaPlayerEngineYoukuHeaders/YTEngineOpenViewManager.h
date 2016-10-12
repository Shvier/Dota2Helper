//
//  YTEngineOpenViewManager.h
//  YouTuEngineMediaPlayer
//
//  Created by 周娜 on 15/10/13.
//  Copyright (c) 2015年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoukuMediaPlayer.h"

@interface YTEngineOpenViewManager : NSObject <YYMediaPlayerEvents>

- (id)initWithPlayer:(YYMediaPlayer *)player;

@property (nonatomic, assign) CGRect controllerFrame;

@end
