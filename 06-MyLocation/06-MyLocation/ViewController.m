//
//  ViewController.m
//  06-MyLocation
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clLocationManager = [[CLLocationManager alloc] init];
    self.clLocationManager.delegate = self;
    self.clLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.clLocationManager requestAlwaysAuthorization];
}

#pragma mark - IBAction

- (void)clickBtnDetect
{
    [self.clLocationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

 - (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    self.lbLocation.text = error.localizedDescription;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"Here");
    [[[CLGeocoder alloc] init] reverseGeocodeLocation:(manager.location) completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            self.lbLocation.text = error.localizedDescription;
            return ;
        }

        if (placemarks.count) {
            CLPlacemark *placemark = placemarks.firstObject;

            self.lbLocation.text = [NSString stringWithFormat:@"Coutry: %@\n Poscode: %@",placemark.country,placemark.postalCode];
        }
        else {
            self.lbLocation.text = @"Unknown";
        }

        [self.clLocationManager stopUpdatingLocation];
    }];
}
@end
