//
//  VSMethodHander.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "VSMethodHander.h"
#import <objc/runtime.h>

static VSMethodHander *VSMethodHanderInstance = nil;

@implementation VSMethodHander
+ (VSMethodHander *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == VSMethodHanderInstance) {
            VSMethodHanderInstance = [[VSMethodHander alloc] init];
        }
    });
    return VSMethodHanderInstance;
}


//- (void)start
//{
//    [self replaceObjectSEL:NSSelectorFromString(@"dealloc") origSEL:@selector(VSDealloc)];
//    [self replaceClass:[UIView class] newSEL:@selector(setFrame:) origSEL:@selector(VSSetFrame:)];
//}


- (void)replaceObjectSEL:(SEL)newSEL origSEL:(SEL)origSEL
{
    [self replaceClass:[NSObject class] newSEL:newSEL origSEL:origSEL];
}

- (void)replaceClass:(Class)className newSEL:(SEL)newSEL origSEL:(SEL)origSEL
{
    Method orig = class_getInstanceMethod(className, origSEL);
    Method new = class_getInstanceMethod(className, newSEL);
    if(class_addMethod(className, origSEL, method_getImplementation(new), method_getTypeEncoding(new)))
    {
        class_replaceMethod(className, newSEL, method_getImplementation(orig), method_getTypeEncoding(orig));
    }
    else
    {
        method_exchangeImplementations(orig, new);
    }
}

- (void)replaceClassMethod:(Class)className newSEL:(SEL)newSEL origSEL:(SEL)origSEL
{
    Method orig = class_getClassMethod(className, origSEL);
    Method new = class_getClassMethod(className, newSEL);
    method_exchangeImplementations(orig, new);

//    if(class_addMethod(className, origSEL, method_getImplementation(new), method_getTypeEncoding(new)))
//    {
//        class_replaceMethod(className, newSEL, method_getImplementation(orig), method_getTypeEncoding(orig));
//    }
//    else
//    {
//        method_exchangeImplementations(orig, new);
//    }
}

@end
