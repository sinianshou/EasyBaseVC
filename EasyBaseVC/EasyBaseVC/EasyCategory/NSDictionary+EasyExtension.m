//
//  NSDictionary+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "NSDictionary+EasyExtension.h"

#import "EasyConstant.h"
@implementation NSDictionary (EasyExtension)

#pragma mark ---- avoid nil crash
- (id)easy_objectForKey:(NSString*)key{
    id object = nil;
    if ([self.allKeys containsObject:key]) {
        object = [self objectForKey:key];
    }else{
        NSLog(@"DICTIONARY:\n object is nil for key:%@", key);
    }
    return object;
}
- (void)easy_setObject:(id)object ForKey:(NSString*)key{
    if (object&&key) {
        [self setValue:object forKey:key];
    }else{
        NSLog(@"DICTIONARY:\n object is %@ for key:%@", object, key);
    }
    
}
@end
