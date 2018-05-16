//
//  UISearchBar+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/11.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UISearchBar+EasyExtension.h"

@implementation UISearchBar (EasyExtension)

-(UITextField*)easy_searchTextField{
    UITextField __block *searchTextField = nil;
    [self.subviews.firstObject.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UITextField class]]) {
            searchTextField = obj;
            *stop = YES;
        }
    }];
    return searchTextField;
}
-(UIButton*)easy_cancelButton{
    UIButton __block *bn = nil;
    [self.subviews.lastObject.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            bn = obj;
            *stop = YES;
        }
    }];
    return bn;
}
@end
