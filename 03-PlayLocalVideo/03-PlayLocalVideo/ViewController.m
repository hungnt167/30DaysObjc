//
//  ViewController.m
//  03-PlayLocalVideo
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (strong, nonatomic) AVPlayerViewController *playCtrl;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.arrMovie = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"videos" ofType:@"plist"]];
    self.playCtrl = [[AVPlayerViewController alloc] init];

    [self.tvMovie registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tvMovie.delegate = self;
    self.tvMovie.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMovie.count;
}

#pragma mark - UITableViewDataDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    cell.textLabel.text = self.arrMovie[indexPath.row][@"title"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.arrMovie[indexPath.row];
    // play
    AVPlayerItem *videoItem = dict[@"video"];
    if (!videoItem) {
        videoItem = [AVPlayerItem playerItemWithURL:[[NSBundle mainBundle] URLForResource:dict[@"src"] withExtension:@"3gpp"]];
        [dict setValue:videoItem forKey:@"video"];
        self.arrMovie[indexPath.row] = dict;
    }

    if (self.playCtrl.player) {
        [self.playCtrl.player replaceCurrentItemWithPlayerItem:videoItem];
    }
    else {
        self.playCtrl.player = [AVPlayer playerWithPlayerItem:videoItem];
    }

    [self presentViewController:self.playCtrl animated:YES completion:^{
        [self.playCtrl.player play];
    }];
}
@end
