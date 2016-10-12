//
//  YTDownloadTaskModel.h
//  YouTuEngineMediaPlayer
//
//  Created by 周娜 on 16/3/29.
//  Copyright © 2016年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTDownloadDefine.h"

@class YTDownloadModelSequence;

// 下载状态
typedef enum {
    ModelState_Wait,
    ModelState_Download,
    ModelState_Pause,
    ModelState_Finish,
    ModelState_Error
} ModelState;

@interface YTDownloadTaskModel : NSObject

@property (nonatomic,retain) NSDictionary    *media;
@property (nonatomic,retain) NSString       *recordId;
@property (nonatomic,retain) NSString       *quality;
@property (nonatomic,retain) NSString       *title;
@property (nonatomic,retain) NSNumber       *seconds;
@property (nonatomic,retain) NSMutableArray *sequenceArray;
@property (nonatomic,assign) BOOL           isFinishedDownload;
@property (nonatomic,assign) BOOL           isReadForDownload;
@property (nonatomic,assign) BOOL toContinueDownload;
@property (nonatomic,assign) NSInteger resourceTimeOutCount;
@property (nonatomic,retain) NSMutableArray *downloadingSequences;
@property (nonatomic,assign) ModelState     modelstate;
@property (nonatomic,retain) NSNumber       *filesize;
@property (nonatomic,retain) NSNumber *currentReceived;

-(id)initWithVideoId:(NSString *)vid;
-(void)removeFiles;
-(NSUInteger)finishedCount;
-(void)finishenSequence:(YTDownloadModelSequence*)aSequence;
-(BOOL)isHaveThisSequence:(YTDownloadModelSequence*)aSequence;
-(void)prepareforDownload:(NSArray*)linksArray file:(NSString *)file;
- (NSString *)cachesPath;
- (NSString *)filePath;
- (NSString *)folderPath;
- (void)createFolder;

@end

@interface YTDownloadModelSequence : NSObject

@property(nonatomic,retain) NSString *floderPath;
@property(nonatomic,retain) NSString *sequenceId;
@property(nonatomic,retain) NSString *file;
@property(nonatomic,retain) NSString *url;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSNumber *seconds;
@property(nonatomic,retain) NSNumber *size;
@property(nonatomic,retain) NSNumber *isFinished;
@property(nonatomic,assign) NSInteger retrycount;
@property(nonatomic,retain) NSData *resumeData;
@property(nonatomic,assign) BOOL isTaskComplete;

- (long long)realSize;

@end

@interface NSFileManager (DoNotBackupDownload)

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

@end
