//
//  DHVideoDetailViewController.m
//  Dota2Helper
//
//  Created by Shvier on 24/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

#import "DHVideoDetailViewController.h"
#import "YTEngineOpenViewManager.h"
#import "YoukuMediaPlayer.h"
#import "YTSequence.h"

#define kYoukuClientId "2f9d050663c87f13"
#define kYoukuClientSecret "bc01abf455c8c702f11eb7217344ce78"

#define kThemeColor [UIColor colorWithRed:0.71 green:0.51 blue:0.39 alpha:1.00]
#define kNavigationHeight 44
#define kStatusBarHeight 20

@interface DHVideoDetailViewController ()

@property (nonatomic, strong) YTEngineOpenViewManager *playerManager;
@property (nonatomic, strong) YYMediaPlayer *player;

@end

@implementation DHVideoDetailViewController

#pragma mark - Setup Player
- (void)initPlayer {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = width * 9.0f / 16.0f;
    CGRect frame = CGRectMake(0, kNavigationHeight + kStatusBarHeight, width, height);
    
    self.player = [[YYMediaPlayer alloc] init];
    self.player.controller = self;
    self.player.view.frame = frame;
    self.player.view.clipsToBounds = YES;
    self.player.fullscreen = NO;
    self.player.platform = @"youku";
    
    [self.view addSubview:self.player.view];
    [self.player addEventsObserver:self];
    
    self.player.clientId = @kYoukuClientId;
    self.player.clientSecret = @kYoukuClientSecret;
    
    self.playerManager = [[YTEngineOpenViewManager alloc] initWithPlayer: self.player];
    self.playerManager.controllerFrame = self.view.bounds;
    [self.player addEventsObserver:self.playerManager];
    
    [self.player playVid:self.ykvid quality:kYYVideoQualityHD2 password:nil from:0];
}

#pragma mark - YYMediaPlayerEvents
- (void)appResign {
    [self.player pause];
}

- (void)appActive {
    [self.player play];
}

- (void)headsetPluggedIn {
    [self.player play];
}

- (void)headsetUnPlugged {
    [self.player pause];
}

- (void)layout:(BOOL)fullscreen {
    if (fullscreen) {
        [self.player.view removeFromSuperview];
        self.player.gravity = YYVideoGravityResizeAspectFill;
        self.player.view.frame = [UIScreen mainScreen].bounds;
    } else {
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = width * 9.0f / 16.0f;
        CGRect frame = CGRectMake(0, kNavigationHeight + kStatusBarHeight, width, height);
        self.player.view.frame = frame;
    }
}

#pragma mark - Life Cycle
- (void)initLifeCycle {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = kThemeColor;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationItem.title = @"正在播放";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLifeCycle];
    [self initPlayer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player stop];
    self.hidesBottomBarWhenPushed = false;
    self.tabBarController.tabBar.hidden = false;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
