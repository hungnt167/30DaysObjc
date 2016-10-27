//
//  ViewController.m
//  05-CarouselEffect
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"
#import "ImageCVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSArray<NSString *> *arrFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundlePath
                                                                                        error:nil];
    NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"self ENDSWITH '.png' || self ENDSWITH '.jpg'"];
    self.arrImage = [arrFiles filteredArrayUsingPredicate:filterPredicate];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark - Priavte
+ (UIColor *)ranColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

}

#pragma mark - UICollectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrImage.count;
}

#pragma mark - UICollectionDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ImageCVC class]) forIndexPath:indexPath];
    [cell imv:self.arrImage[indexPath.row]];
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, self.view.frame.size.width, self.collectionView.frame.size.height);
    cell.backgroundColor = [self.class ranColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCVC *cell = (ImageCVC *) [collectionView cellForItemAtIndexPath:indexPath];
    cell.lbTitle.textColor = [self.class ranColor];
    [collectionView reloadData];
}
@end
