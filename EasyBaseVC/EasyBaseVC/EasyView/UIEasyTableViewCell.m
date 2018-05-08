//
//  UIEasyTableViewCell.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyTableViewCell.h"

#import "EasyConstant.h"
@implementation UIEasyTableViewCell

- (BOOL)refreshModel:(id)model withUserInfo:(id)userInfo{
    [self clear];
    return YES;
}

- (CGFloat)cellHeight{
    return 44.0f;
}

- (void)clear{
    
}

-(BOOL)isFirstResponder{
    if ([super isFirstResponder]) {
        return YES;
    }
    BOOL __block bl = NO;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isFirstResponder]) {
            bl = YES;
            *stop = YES;
        }
    }];
    return bl;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
