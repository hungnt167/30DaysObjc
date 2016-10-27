//
//  ImageCVC.m
//  05-CarouselEffect
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ImageCVC.h"

@implementation ImageCVC

- (void)imv:(NSString *)imvName
{
    self.lbTitle.text = imvName;
    self.imv.image = [UIImage imageNamed:imvName];
}

@end
