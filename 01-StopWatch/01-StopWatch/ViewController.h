//
//  ViewController.h
//  01-StopWatch
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSNumber *counter;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) BOOL isPlaying;
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *btnReset;

- (IBAction)clickBtnPlay;
- (IBAction)clickBtnReset;

@end

