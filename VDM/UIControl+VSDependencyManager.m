//
//  UIControl+VSDependencyManager.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "UIControl+VSDependencyManager.h"
#import "VSDependencyManager.h"
@implementation UIControl (VSDependencyManager)
- (void)addDependencyTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
{
    [[VSDependencyManager shareInstance] addObserver:target source:self];
    self.exclusiveTouch = YES;
    [self addDependencyTarget:target action:action forControlEvents:controlEvents];
}
@end
