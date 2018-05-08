//
//  UIColor+EasyExtension.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/7.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EasyExtension)

#pragma mark ---- colorWithHexString
// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) easy_colorWithHexString: (NSString *)color;
@end
