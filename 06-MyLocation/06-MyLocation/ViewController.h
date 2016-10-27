//
//  ViewController.h
//  06-MyLocation
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *clLocationManager;

@property (weak, nonatomic) IBOutlet UILabel *lbLocation;
@property (weak, nonatomic) IBOutlet UIButton *btnDetect;

- (IBAction)clickBtnDetect;

@end

