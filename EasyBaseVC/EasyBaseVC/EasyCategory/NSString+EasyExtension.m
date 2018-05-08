//
//  NSString+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "NSString+EasyExtension.h"

#import "EasyConstant.h"
@implementation NSString (EasyExtension)

#pragma mark ---- compare
- (BOOL)easy_isEmpty{
    return !self || [self isEqualToString:@""];
}
@end
