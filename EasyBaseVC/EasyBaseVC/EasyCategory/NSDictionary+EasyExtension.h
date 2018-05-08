//
//  NSDictionary+EasyExtension.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (EasyExtension)

- (id)easy_objectForKey:(NSString*)key;
- (void)easy_setObject:(id)object ForKey:(NSString*)key;

@end
