//
//  ViewController.m
//  04-SnapChatMenu
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"
#import "LeftMenuVC.h"
#import "CenterVC.h"
#import "RightMenuVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LeftMenuVC *leftVC = [[LeftMenuVC alloc] initWithNibName:NSStringFromClass([LeftMenuVC class]) bundle:self.nibBundle];

    CenterVC *centerVC = [[CenterVC alloc] initWithNibName:NSStringFromClass([CenterVC class]) bundle:self.nibBundle];

    RightMenuVC *rightVC = [[RightMenuVC alloc] initWithNibName:NSStringFromClass([RightMenuVC class]) bundle:self.nibBundle];

    [self addChildViewController:leftVC];
    [self.scrollView addSubview:leftVC.view];
    [leftVC didMoveToParentViewController:self];

    [self addChildViewController:rightVC];
    [self.scrollView addSubview:rightVC.view];
    [rightVC didMoveToParentViewController:self];

    [self addChildViewController:centerVC];
    [self.scrollView addSubview:centerVC.view];
    [centerVC didMoveToParentViewController:self];

    CGRect centerFrame = self.view.frame;
    centerFrame.origin.x = self.view.frame.size.width;
    centerVC.view.frame = centerFrame;
    CGRect rightFrame = self.view.frame;
    rightFrame.origin.x = self.view.frame.size.width * 2;
    rightVC.view.frame = rightFrame;
    self.scrollView.frame = self.view.frame;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
}



@end
