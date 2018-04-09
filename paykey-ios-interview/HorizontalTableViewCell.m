//
//  HorizontalTableViewCell.m
//  paykey-ios-interview
//
//  Created by rotem nevgauker on 4/9/18.
//  Copyright © 2018 ishay weinstock. All rights reserved.
//

#import "HorizontalTableViewCell.h"

@implementation HorizontalTableViewCell
@synthesize text;

- (id)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        self.frame = frame;
        text = [[UILabel alloc] initWithFrame:frame];
        text.textColor = [UIColor blackColor];
        text.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:text];
    }
    return self;
    
}

@end
