//
//  DHRelatedVideoViewModel.m
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import "DHRelatedVideoViewModel.h"
#import "DHRelatedVideoModel.h"

@implementation DHRelatedVideoViewModel

+ (DHRelatedVideoViewModel *)viewModelWithModel:(DHRelatedVideoModel *)model {
    DHRelatedVideoViewModel *viewModel = [[DHRelatedVideoViewModel alloc] initWithModel:model];
    return viewModel;
}

- (instancetype)initWithModel:(DHRelatedVideoModel *)model {
    self.ykvid = model.ykvid;
    self.title = model.title;
    {
        NSInteger length = [model.duration integerValue];
        NSString *duration = @"";
        if (length > 3600) {
            NSInteger hour = length / 3600;
            NSInteger minute = length % 60 / 60;
            NSInteger second = length % 3600;
            duration = [NSString stringWithFormat:@"%ld:%ld:%ld", hour, minute, second];
        } else if (length > 60) {
            NSInteger minute = length / 60;
            NSInteger second = length % 60;
            duration = [NSString stringWithFormat:@"%ld:%ld", minute, second];
        } else {
            duration = model.duration;
        }
        self.videolength = duration;
    }
    {
        self.publishin = [model.published substringWithRange:NSMakeRange(5, 5)];
    }
    self.backgroundImage = model.bigThumbnail;
    return self;
}

@end
