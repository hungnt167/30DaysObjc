//
//  ViewController.h
//  09-ImageScroller
//
//  Created by HungNT on 10/28/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imvNeededScoll;
@property (weak, nonatomic) IBOutlet UIScrollView *svImage;

@end

