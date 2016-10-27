//
//  ViewController.m
//  07-Pull2F5
//
//  Created by HungNT on 10/27/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr = [self.class generateArr];

    self.tvController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.tvController.tableView.delegate = self;
    self.tvController.tableView.dataSource = self;

    UITableView *tv = self.tvController.tableView;
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    tv.rowHeight = UITableViewAutomaticDimension;
    tv.estimatedRowHeight = 100;

    self.f5Control = [[UIRefreshControl alloc] init];
    self.f5Control.attributedTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Last updated at: %@", [NSDate date]]];

    [self.f5Control addTarget:self action:@selector(updateTV) forControlEvents:UIControlEventValueChanged];

    self.tvController.refreshControl = self.f5Control;

    self.contentView.frame = self.view.frame;
    [self.contentView addSubview:tv];
    [self updateTotal];
}

#pragma mark - Private
+ (NSMutableArray *) generateArr
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [arr addObject:[[NSProcessInfo processInfo] globallyUniqueString]];
    }
    return arr;
}

- (void)updateTV
{
     self.f5Control.attributedTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Last updated at: %@", [NSDate date]]];
    [self.arr addObjectsFromArray: [self.class generateArr] ];
    [self.tvController.tableView reloadData];
    [self.f5Control endRefreshing];
    [self updateTotal];
}

- (void) updateTotal
{
    self.lbTotalRow.text = [NSString stringWithFormat:@"Total: %li row(s).", self.arr.count];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}
@end
