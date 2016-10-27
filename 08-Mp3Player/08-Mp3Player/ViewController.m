//
//  ViewController.m
//  08-Mp3Player
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray<NSString *> *arrAudio;
@property (assign, nonatomic) NSInteger currentIndex;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // scan files
    self.arrAudio = [[[NSFileManager defaultManager] contentsOfDirectoryAtPath:[[NSBundle mainBundle] bundlePath]
                                                                        error:nil] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH '.mp3'"]];
    self.currentIndex = 0;

    // active audio session
    AVAudioSession *aVAudioSession = [AVAudioSession sharedInstance];
    [aVAudioSession setActive:YES error:nil];
    [aVAudioSession setCategory:AVAudioSessionCategoryPlayback error:nil];

    // init gradient
    CAGradientLayer *layer = [CAGradientLayer layer];


    layer.colors = @[
                     (id)[self.class ranColor].CGColor,
                     (id)[self.class ranColor].CGColor,
                     (id)[self.class ranColor].CGColor,
                     (id)[self.class ranColor].CGColor,
                     (id)[self.class ranColor].CGColor
                     ];
    layer.locations = @[@(0.1),@(0.3),@(0.5),@(0.7), @(0.9)];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);

    layer.frame = self.view.frame;

    [self.vGradient.layer addSublayer:layer];

    // update
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer){
        layer.colors = @[(id)[self.class ranColor].CGColor, (id)[self.class ranColor].CGColor, (id)[self.class ranColor].CGColor, (id)[self.class ranColor].CGColor];
        if (self.player.isPlaying) {
            self.lbCurrentTime.text = [self.class stringFromTimeInterval:self.player.currentTime];
        }
    }];
}

#pragma mark - Priavte
+ (UIColor *)ranColor
{


    CGFloat red = (CGFloat)drand48();
    CGFloat green = (CGFloat)drand48();
    CGFloat blue = (CGFloat)drand48();
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];

}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

- (void)play
{
    BOOL canPlay = self.player?self.player.isPlaying:YES;

    NSURL *url = [[NSBundle mainBundle] URLForResource:[self.arrAudio[self.currentIndex] stringByDeletingPathExtension] withExtension:[self.arrAudio[self.currentIndex] pathExtension]];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];



    self.lbDurringTime.text = [self.class stringFromTimeInterval:self.player.duration];
    self.lbSongTitle.text = [self.arrAudio[self.currentIndex] capitalizedString];

    [self.player prepareToPlay];

    if (canPlay) {
        [self.player play];
    }
}

- (void)pause
{
    [self.player pause];
    [self.btnPlay setTitle:@"Play" forState:UIControlStateNormal];
}

#pragma mark - IBAction
- (void)jump:(UIButton *)btn
{
    if (btn == self.btnNext) {
        self.currentIndex++;
        if (self.currentIndex > self.arrAudio.count - 1) {
            self.currentIndex = 0;
        }
    }
    else {
        self.currentIndex--;
        if (self.currentIndex < 0) {
            self.currentIndex = self.arrAudio.count - 1;
        }
    }
    [self play];
}

- (void)power
{
    [self.btnPlay setTitle:@"Pause" forState:UIControlStateNormal];
    if (!self.player) {
        [self play];
        return;
    }

    if (self.player.isPlaying) {
        [self pause];
        return;
    }

    [self.player play];
}
@end
