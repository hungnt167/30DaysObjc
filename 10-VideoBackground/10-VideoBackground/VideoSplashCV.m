//
//  VideoSplashCV.m
//  10-VideoBackground
//
//  Created by HungNT on 10/28/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "VideoSplashCV.h"
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoSplashCV () <AVPlayerViewControllerDelegate>

@property (strong, nonatomic) AVPlayerViewController *avPlayVC;

@end

@implementation VideoSplashCV

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVideoBackground];
    [self.view addSubview:self.avPlayVC.view];
    [self.view sendSubviewToBack:self.avPlayVC.view];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    self.avPlayVC.view.frame = self.view.frame;
    self.avPlayVC.showsPlaybackControls = NO;

  }

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark - Private
- (void)setupVideoBackground
{
    self.avPlayVC = [[AVPlayerViewController alloc] init];
    self.avPlayVC.player = [[AVPlayer alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"1" withExtension:@"3gpp"]];
    self.avPlayVC.view.frame = self.view.frame;

    self.avPlayVC.view.userInteractionEnabled = NO;
    self.avPlayVC.view.alpha = 0.8f;
    self.avPlayVC.player.volume = 0;
    self.avPlayVC.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.avPlayVC.delegate = self;
    [self.avPlayVC.player play];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidEndding) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}


- (void)videoDidEndding
{
    [self.avPlayVC.player seekToTime:kCMTimeZero];
    [self.avPlayVC.player play];
}
@end
