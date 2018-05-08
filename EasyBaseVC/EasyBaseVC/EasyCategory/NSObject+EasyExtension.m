//
//  NSObject+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "NSObject+EasyExtension.h"

#import "EasyConstant.h"
@implementation NSObject (EasyExtension)

#pragma mark ---- property and method list
static const char *easyPropertyListKey = "EasyPropertyList";
- (NSArray*)easy_PropertyList{
    NSArray* arr = objc_getAssociatedObject(self, easyPropertyListKey);
    if (arr == nil) {
        [self easy_SetPropertyList];
        arr = objc_getAssociatedObject(self, easyPropertyListKey);
    }
    return arr;
}
-(void)easy_SetPropertyList{
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyList = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *nameStr = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        [propertyList addObject:nameStr];
    }
    free(properties);
    objc_setAssociatedObject(self, easyPropertyListKey, propertyList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *easyMethodListKey = "EasyMethodList";
- (NSArray*)easy_MethodList{
    NSArray* arr = objc_getAssociatedObject(self, easyMethodListKey);
    if (arr == nil) {
        [self easy_SetMethodList];
        arr = objc_getAssociatedObject(self, easyMethodListKey);
    }
    return arr;
}
- (void)easy_SetMethodList{
    u_int count = 0;
    Method *methods = class_copyMethodList([self class], &count);
    NSMutableArray *methodList = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL methodSEL = method_getName(method);
        if (methodSEL) {
            NSString * methodStr = NSStringFromSelector(methodSEL);
            [methodList addObject:methodStr];
        }
    }
    free(methods);
    objc_setAssociatedObject(self, easyMethodListKey, methodList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark ---- perform selector
- (id)easy_performSelector:(SEL)aSelector withObject:(id)object{
    if (!aSelector) {
        return nil;
    }
    if ([self respondsToSelector:aSelector]) {
        return [self performSelector:aSelector withObject:object];
    }
    return nil;
}
@end
