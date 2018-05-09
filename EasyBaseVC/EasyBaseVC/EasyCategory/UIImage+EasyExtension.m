//
//  UIImage+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/8.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIImage+EasyExtension.h"

@implementation UIImage (EasyExtension)
+ (UIImage*) easy_imageWithColor: (UIColor*) color size:(CGSize)size{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    if (size.width&&size.height) {
        rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    }else{
        rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}
@end
