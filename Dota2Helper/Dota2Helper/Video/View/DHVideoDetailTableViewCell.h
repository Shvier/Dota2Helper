//
//  DHVideoDetailTableViewCell.h
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHRelatedVideoViewModel;

@interface DHVideoDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoLengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishinLabel;
@property (nonatomic, strong) NSString *ykvid;

- (void)bindDataWithViewModel:(DHRelatedVideoViewModel *)viewModel;

@end
