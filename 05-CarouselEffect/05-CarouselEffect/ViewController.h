//
//  ViewController.h
//  05-CarouselEffect
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray <NSString *> *arrImage;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

