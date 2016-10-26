//
//  ViewController.h
//  02-CustomFont
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *arrFont;
@property (weak, nonatomic) IBOutlet UITableView *tvFont;
@property (weak, nonatomic) IBOutlet UILabel *lbText;

@end

