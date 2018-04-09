//
//  HorizontalScrollView.m
//  paykey-ios-interview
//
//  Created by Ishay Weinstock on 12/16/14.
//  Copyright (c) 2014 Ishay Weinstock. All rights reserved.
//

#import "HorizontalTableView.h"

#define SEPARATOR_WIDTH 1
#define DEFAULT_CELL_WIDTH 100
#define DEFAULT_CELL_HEIGHT 100

@implementation HorizontalTableView
@synthesize scrollView;

- (id)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        scrollView = [[UIScrollView alloc]initWithFrame:frame];
        scrollView.backgroundColor = [UIColor darkGrayColor];
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:scrollView];
    }
    return  self;
}

- (HorizontalTableViewCell*)dequeueCell{
    HorizontalTableViewCell *cell = [[HorizontalTableViewCell alloc]initWithFrame:CGRectMake(0, 0, DEFAULT_CELL_WIDTH, DEFAULT_CELL_HEIGHT)];
    
    CGRect frame = cell.frame;
    if (self.cellHeight != 0) {
        frame.size.height = self.cellHeight;
    }
    if (self.cellWidth!= 0) {
        frame.size.width = _cellWidth;
    }
    cell.frame = frame;
    return cell;
}

- (void)reloadData {
    for (UIView *subUIView in self.scrollView.subviews) {
        [subUIView removeFromSuperview];
    }
    
    if (self.dataSource) {
        NSInteger numberOfCells = [self.dataSource horizontalTableViewNumberOfCells:self];
        for (int i=0;i<numberOfCells;i++) {
            UIView *cell = [self.dataSource horizontalTableView:self cellForIndex:i];
            CGRect frame = cell.frame;
            
            if (_cellWidth == 0) {
                frame.origin.x = i * DEFAULT_CELL_WIDTH + SEPARATOR_WIDTH;
            }else {
                frame.origin.x = i * _cellWidth + SEPARATOR_WIDTH;
            }
            cell.frame = frame;
            [self.scrollView addSubview:cell];
            
        }
        if (_cellWidth == 0) {
            self.scrollView.contentSize = CGSizeMake(numberOfCells * DEFAULT_CELL_WIDTH, self.scrollView.contentSize.height);
        }else {
            self.scrollView.contentSize = CGSizeMake(numberOfCells * _cellWidth, self.scrollView.contentSize.height);
        }
    }
}

@end
