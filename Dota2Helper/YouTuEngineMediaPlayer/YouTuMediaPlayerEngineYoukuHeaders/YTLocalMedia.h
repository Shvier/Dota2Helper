//
//  LocalMedia.h
//  TestYKMediaPlayer
//
//  Created by 周娜 on 16/4/22.
//  Copyright © 2016年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface YTLocalMedia : NSManagedObject

@property (nullable, nonatomic, copy) NSString *videoid;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *seconds;
@property (nullable, nonatomic, retain) NSNumber *createTime;
@property (nullable, nonatomic, retain) NSNumber *size;
@property (nullable, nonatomic, retain) NSNumber *isFinished;
@property (nullable, nonatomic, copy) NSString *quality;
@property (nullable, nonatomic, retain) NSNumber *finishTime;
@property (nullable, nonatomic, retain) NSNumber *state;
@property (nullable, nonatomic, retain) NSNumber *downSize;
@property (nullable, nonatomic, copy) NSMutableSet *sequences;
@property (nullable, nonatomic, strong) NSNumber *progress;//下载进度，动态算的

- (nullable NSString *)mediaPath; //视频目录
- (long long)calcuteTrueSize;
- (nullable NSNumber *)totalSize;//已下载的大小
- (void)removeFile;
- (BOOL)canPlay;//是否可以被播放

@end
