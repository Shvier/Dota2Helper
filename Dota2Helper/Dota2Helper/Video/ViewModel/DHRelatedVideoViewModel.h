//
//  DHRelatedVideoViewModel.h
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHRelatedVideoModel;

@interface DHRelatedVideoViewModel : NSObject

@property (nonatomic, strong) NSString *ykvid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *videolength;
@property (nonatomic, strong) NSString *publishin;
@property (nonatomic, strong) NSString *backgroundImage;

+ (DHRelatedVideoViewModel *)viewModelWithModel:(DHRelatedVideoModel *)viewModel;

@end
