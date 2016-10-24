//
//  DHVideoDetailDataController.m
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import "DHVideoDetailDataController.h"
#import "DHRelatedVideoModel.h"

#define kYoukuClientId @"2f9d050663c87f13"
#define kGetRelatedVideoListUrl @"http://openapi.youku.com/v2/videos/by_related.json"

@implementation DHVideoDetailDataController

- (void)requestVideoDetailDataWithYkVid:(NSString *)ykvid andCompletion:(void (^)())completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?client_id=%@&video_id=%@&count=10", kGetRelatedVideoListUrl, kYoukuClientId, ykvid]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *resultArray = result[@"videos"];
            self.dataSource = [NSMutableArray array];
            for (NSDictionary *dict in resultArray) {
                DHRelatedVideoModel *relatedVideoModel = [[DHRelatedVideoModel alloc] init];
                [relatedVideoModel setValuesForKeysWithDictionary:dict];
                [self.dataSource addObject:relatedVideoModel];
            }
            completion();
        }
    }];
    [dataTask resume];
}

@end
