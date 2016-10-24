//
//  DHVideoDetailDataController.h
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHVideoDetailDataController : NSObject

@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)requestVideoDetailDataWithYkVid:(NSString *)ykvid andCompletion:(void (^)())completion;

@end
