//
//  Sequence.h
//  TestYKMediaPlayer
//
//  Created by 周娜 on 16/4/22.
//  Copyright © 2016年 Youku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class YTLocalMedia;

@interface YTSequence : NSManagedObject

@property (nullable, nonatomic, retain) NSNumber *seqenceid;
@property (nullable, nonatomic, copy) NSString *file;
@property (nullable, nonatomic, retain) NSNumber *isFinished;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSNumber *seconds;
@property (nullable, nonatomic, retain) NSNumber *size;
@property (nullable, nonatomic, copy) NSString *quality;
@property (nullable, nonatomic, retain) NSNumber *downSize;
@property (nullable, nonatomic, retain) YTLocalMedia *localMedia;
@property (nullable, nonatomic, copy) NSString *resumeData;


- (BOOL)finishedOrNot;
- (long long)localSequenceSize;


@end

