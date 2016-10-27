//
//  ViewController.h
//  08-Mp3Player
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIView *vGradient;
@property (weak, nonatomic) IBOutlet UILabel *lbSongTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDurringTime;
@property (weak, nonatomic) IBOutlet UILabel *lbCurrentTime;
@property (weak, nonatomic) IBOutlet UIButton *btnPrev;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

- (IBAction)jump:(UIButton *) btn;
- (IBAction)power;
@end

