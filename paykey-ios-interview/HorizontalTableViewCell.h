//
//  HorizontalTableViewCell.h
//  paykey-ios-interview
//
//  Created by rotem nevgauker on 4/9/18.
//  Copyright © 2018 ishay weinstock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalTableViewCell : UIView {
    NSString *identifier;
    UILabel *text;
    
}
@property(nonatomic,strong)UILabel *text;

- (id)initWithFrame:(CGRect)frame;

@end
