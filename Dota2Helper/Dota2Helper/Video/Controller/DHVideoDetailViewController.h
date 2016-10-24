//
//  DHVideoDetailViewController.h
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYMediaPlayerEvents.h"

@interface DHVideoDetailViewController : UIViewController <YYMediaPlayerEvents>

@property (nonatomic, strong) NSString *ykvid;

@end
