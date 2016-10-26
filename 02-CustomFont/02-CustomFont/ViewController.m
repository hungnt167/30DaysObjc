//
//  ViewController.m
//  02-CustomFont
//
//  Created by HungNT on 10/26/16.
//  Copyright © 2016 hungnt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static int size = 100;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrFont = [NSMutableArray array];
    self.lbText.text = [NSString  stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"text" ofType:@"strings"] encoding:kCFStringEncodingUTF8 error:nil];
    [self.tvFont registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tvFont.delegate = self;
    self.tvFont.dataSource = self;

    for (NSString *family in [UIFont familyNames
                              ]) {
        for (NSString *font in [UIFont fontNamesForFamilyName:family] ) {
            [self.arrFont addObject:font];
        }
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrFont.count;
}

#pragma mark - UITableViewDataDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.arrFont[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.lbText.font = [UIFont fontWithName:self.arrFont[indexPath.row] size:size]?:[UIFont systemFontOfSize:size];
}

@end
