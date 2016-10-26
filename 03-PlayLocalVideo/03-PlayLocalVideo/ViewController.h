//
//  ViewController.h
//  03-PlayLocalVideo
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray<NSDictionary *> *arrMovie;
@property (weak, nonatomic) IBOutlet UITableView *tvMovie;

@end

