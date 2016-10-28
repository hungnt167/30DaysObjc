//
//  ViewController.m
//  09-ImageScroller
//
//  Created by HungNT on 10/28/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imvNeededScoll = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Eddi"]];
    [self setupContent];
    [self setZoomScale];
    [self.view layoutIfNeeded];
    [self centerImage];
}


#pragma mark - Private

- (void)setupContent
{

    [self.svImage addSubview:self.imvNeededScoll];
    self.svImage.contentSize = self.imvNeededScoll.frame.size;
    self.svImage.delegate = self;
}

- (void)setZoomScale {
    CGFloat heightScale = self.svImage.frame.size.height / self.imvNeededScoll.frame.size.height;
    CGFloat widthScale = self.svImage.frame.size.width / self.imvNeededScoll.frame.size.width;

    self.svImage.minimumZoomScale = MIN(widthScale, heightScale);
    self.svImage.maximumZoomScale = 3.0;
    self.svImage.zoomScale = self.svImage.minimumZoomScale;
}

- (void)centerImage
{
    CGFloat verticalSpace = self.svImage.frame.size.width > self.imvNeededScoll.frame.size.width?(self.svImage.frame.size.width - self.imvNeededScoll.frame.size.width) /2:0;
    CGFloat horizontalSpace = self.svImage.frame.size.height > self.imvNeededScoll.frame.size.height?(self.svImage.frame.size.height - self.imvNeededScoll.frame.size.height) /2:0;
    self.svImage.contentInset = UIEdgeInsetsMake(horizontalSpace, verticalSpace, horizontalSpace, verticalSpace);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self centerImage];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imvNeededScoll;
}
@end
