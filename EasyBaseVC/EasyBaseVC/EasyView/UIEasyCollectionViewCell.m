//
//  UIEasyCollectionViewCell.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/3.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyCollectionViewCell.h"

@implementation UIEasyCollectionViewCell
- (BOOL)refreshModel:(id)model withUserInfo:(id)userInfo{
    [self clear];
    return YES;
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
#pragma mark ---- Setter
#pragma mark ---- Getter
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UIView *view = self;
        do {
            view = view.superview;
        } while (![view isKindOfClass:[UICollectionView class]] || !view);
        _collectionView = (UICollectionView *)view;
    }
    return _collectionView;
}
@end
