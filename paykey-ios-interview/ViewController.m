//
//  ViewController.m
//  paykey-ios-interview
//
//  Created by Ishay Weinstock on 2/15/16.
//  Copyright © 2016 Ishay Weinstock. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalTableView.h"
#import "HorizontalTableViewCell.h"
@interface ViewController () <HorizontalTableViewDataSource>

@property (strong) HorizontalTableView *horizontalTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.horizontalTableView = [[HorizontalTableView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.horizontalTableView];
    self.horizontalTableView.dataSource = self;
    self.horizontalTableView.backgroundColor = [UIColor redColor];
    //self.horizontalTableView.cellWidth = 55.0f;
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.horizontalTableView.frame = CGRectMake(0,100,CGRectGetWidth(self.view.bounds),100);
    [self.horizontalTableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark HorizontalTableViewDelegate

- (NSInteger)horizontalTableViewNumberOfCells:(HorizontalTableView*)tableView{
    return 100;
}

- (HorizontalTableViewCell*)horizontalTableView:(HorizontalTableView*)tableView cellForIndex:(NSInteger)index{
    HorizontalTableViewCell* cell = [tableView dequeueCell];
    cell.text.text = [[NSString alloc] initWithFormat:@"%ld",(long)index];
    cell.text.textAlignment = NSTextAlignmentCenter;
    return cell;
}

@end
