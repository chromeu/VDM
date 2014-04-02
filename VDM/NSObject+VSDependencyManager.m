//
//  NSObject+deleteDependence.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "NSObject+VSDependencyManager.h"
#import "VSDependencyManager.h"
@implementation NSObject (VSDependencyManager)
//- (void)VSDealloc
//{
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[VSDependencyManager shareInstance] removeObserver:self];
//    [self VSDealloc];
//}

- (void)addDependencyObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if(![[VSDependencyManager shareInstance] observer:observer inkeySource:self keyPath:keyPath]){
        VSDependencyObject *obj = [[VSDependencyObject alloc] initWithResource:self key:keyPath];
        [[VSDependencyManager shareInstance] addObserver:observer keySource:obj];
        [self addDependencyObserver:observer forKeyPath:keyPath options:options context:context];
#if __has_feature(objc_arc)
        // ARC is On
#else
        // ARC is Off
        [obj release];
#endif
    }
}

- (void)removeOCObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    if([[VSDependencyManager shareInstance] observerremove:observer inkeySource:self keyPath:keyPath]){
        [self removeOCObserver:observer forKeyPath:keyPath];
    }

}


- (void)removeOCObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context{
    if([[VSDependencyManager shareInstance] observerremove:observer inkeySource:self keyPath:keyPath]){
        [self removeOCObserver:observer forKeyPath:keyPath context:context];
    }
}

@end
