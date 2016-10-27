//
//  ImageCVC.h
//  05-CarouselEffect
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCVC : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imv;

- (void) imv:(NSString *)imvName;

@end
