//
//  NSObject+EasyExtension.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EasyExtension)

#pragma mark ---- property and method list
- (NSArray*)easy_PropertyList;
- (NSArray*)easy_MethodList;

#pragma mark ---- perform selector
- (id)easy_performSelector:(SEL)aSelector withObject:(id)object;
@end
