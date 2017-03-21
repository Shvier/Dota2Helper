//
//  DHVideoDetailTableViewCell.m
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import "DHVideoDetailTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DHRelatedVideoViewModel.h"

@implementation DHVideoDetailTableViewCell

- (void)bindDataWithViewModel:(DHRelatedVideoViewModel *)viewModel {
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.backgroundImage]];
    self.titleLabel.text = viewModel.title;
    self.videoLengthLabel.text = viewModel.videolength;
    self.publishinLabel.text = viewModel.publishin;
    self.ykvid = viewModel.ykvid;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
