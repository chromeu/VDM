//
//  UIGestureRecognizer+VSDependencyManager.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "UIGestureRecognizer+VSDependencyManager.h"
#import "VSDependencyManager.h"
@implementation UIGestureRecognizer (VSDependencyManager)
- (id)initDependencyWithTarget:(id)target action:(SEL)action
{
    [[VSDependencyManager shareInstance] addObserver:target source:self];
    return [self initDependencyWithTarget:target action:action];
}

- (void)addDependencyTarget:(id)target action:(SEL)action
{
    [[VSDependencyManager shareInstance] addObserver:target source:self];
    [self addDependencyTarget:target action:action];
}
@end
