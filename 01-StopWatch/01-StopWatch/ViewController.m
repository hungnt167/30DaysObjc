//
//  ViewController.m
//  01-StopWatch
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reset];
    self.timer = [[NSTimer alloc] init];
}

#pragma mark - Private
- (void) reset
{
    self.isPlaying = NO;
    self.counter = @(0.0f);
    self.lbTime.text = self.counter.stringValue;

    if (self.timer) {
        [self.timer invalidate];
    }
}


- (void)clickBtnPlay
{

    self.isPlaying = !self.isPlaying;
    if (!self.isPlaying) {
        [self.timer invalidate];
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.counter = @(self.counter.floatValue + 0.1);
        self.lbTime.text = [NSString stringWithFormat:@"%0.1f",self.counter.floatValue];
    }];
}

- (void)clickBtnReset
{
    [self reset];
}

@end
