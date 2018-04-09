//
//  HorizontalScrollView.h
//  paykey-ios-interview
//
//  Created by Ishay Weinstock on 12/16/14.
//  Copyright (c) 2014 Ishay Weinstock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalTableViewCell.h"

@class HorizontalTableView;

@protocol HorizontalTableViewDataSource <NSObject>

- (UIView*)horizontalTableView:(HorizontalTableView*)tableView cellForIndex:(NSInteger)index;
- (NSInteger)horizontalTableViewNumberOfCells:(HorizontalTableView*)tableView;

@end

@interface HorizontalTableView : UIView

@property (weak)   id<HorizontalTableViewDataSource>    dataSource;
@property (assign) CGFloat                              cellWidth;
@property (assign) CGFloat                              cellHeight;
@property (strong) UIScrollView* scrollView;

- (HorizontalTableViewCell*)dequeueCell;
- (void)reloadData;
- (id)initWithFrame:(CGRect)frame;

@end
