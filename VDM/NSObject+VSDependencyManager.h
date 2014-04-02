//
//  NSObject+deleteDependence.h
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (VSDependencyManager)
- (void)addDependencyObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

- (void)removeOCObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

- (void)removeOCObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;
@end
