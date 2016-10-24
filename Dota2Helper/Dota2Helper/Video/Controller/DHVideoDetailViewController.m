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
#import "YYMediaPlayerEvents.h"
#import "DHVideoDetailTableViewCell.h"
#import "DHVideoDetailDataController.h"
#import "DHRelatedVideoViewModel.h"
#import "DHRelatedVideoModel.h"

#define kYoukuClientId @"2f9d050663c87f13"
#define kYoukuClientSecret @"bc01abf455c8c702f11eb7217344ce78"
#define kVideoDetailCellReuseIdentifier @"VideoDetailTableViewCell"

#define kThemeColor [UIColor colorWithRed:0.71 green:0.51 blue:0.39 alpha:1.00]
#define kNavigationHeight 44
#define kStatusBarHeight 20
#define kVideoDetailTableViewCellHeight 80

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DHVideoDetailViewController () <UITableViewDelegate, UITableViewDataSource, YYMediaPlayerEvents>

@property (nonatomic, strong) YTEngineOpenViewManager *playerManager;
@property (nonatomic, strong) YYMediaPlayer *player;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DHVideoDetailDataController *dataController;

@end

@implementation DHVideoDetailViewController

- (DHVideoDetailDataController *)dataController {
    self.dataController = [[DHVideoDetailDataController alloc] init];
    return _dataController;
}

- (void)handleData {
    [self.dataController requestVideoDetailDataWithYkVid:self.ykvid andCompletion:^{
        [self renderTableView];
    }];
}

- (void)renderTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Setup Player
- (void)initPlayer {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = width * 9.0f / 16.0f;
    CGRect frame = CGRectMake(0, 0, width, height);
    
    self.player = [[YYMediaPlayer alloc] init];
    self.player.controller = self;
    self.player.view.frame = frame;
    self.player.view.clipsToBounds = YES;
    self.player.fullscreen = NO;
    self.player.platform = @"youku";
    
    [self.view addSubview:self.player.view];
    [self.player addEventsObserver:self];
    
    self.player.clientId = kYoukuClientId;
    self.player.clientSecret = kYoukuClientSecret;
    
    self.playerManager = [[YTEngineOpenViewManager alloc] initWithPlayer: self.player];
    self.playerManager.controllerFrame = self.view.bounds;
    [self.player addEventsObserver:self.playerManager];
    
    [self.player playVid:self.ykvid quality:kYYVideoQualityHD2 password:nil from:0];
}

#pragma mark - Setup TableView
- (void)initTableView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.player.view.frame.size.height, kScreenWidth, 30)];
    label.text = @"相关内容";
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.player.view.frame.size.height + label.frame.size.height - 1, kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:0.87 green:0.86 blue:0.87 alpha:1.00];
    [self.view addSubview:lineView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.player.view.frame.size.height + label.frame.size.height, kScreenWidth, kScreenHeight - self.player.view.frame.size.height - label.frame.size.height - kNavigationHeight - kStatusBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"DHVideoDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kVideoDetailCellReuseIdentifier];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataController.dataSource.count > 0 ? _dataController.dataSource.count : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kVideoDetailTableViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DHVideoDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVideoDetailCellReuseIdentifier forIndexPath:indexPath];
    if (_dataController.dataSource.count > 0) {
        DHRelatedVideoModel *model = _dataController.dataSource[indexPath.row];
        DHRelatedVideoViewModel *viewModel = [DHRelatedVideoViewModel viewModelWithModel:model];
        [cell bindDataWithViewModel:viewModel];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DHVideoDetailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.player playVid:cell.ykvid quality:kYYVideoQualityHD2 password:nil from:0];
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
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) {
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = width * 9.0f / 16.0f;
        CGRect frame = CGRectMake(0, 0, width, height);
        self.player.view.frame = frame;
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        self.tableView.hidden = NO;
    } else {
        self.tableView.hidden = YES;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        self.player.view.frame = [UIScreen mainScreen].bounds;
    }
}

#pragma mark - Life Cycle
- (void)initLifeCycle {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = kThemeColor;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationItem.title = @"正在播放";
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLifeCycle];
    [self initPlayer];
    [self initTableView];
    [self handleData];
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
