//
//  ViewController.h
//  07-Pull2F5
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableViewController *tvController;
@property (strong, nonatomic) UIRefreshControl *f5Control;

@property (weak, nonatomic) IBOutlet UILabel *lbTotalRow;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

