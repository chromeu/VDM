//
//  UIViewController+VSDependencyManager.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-25.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "UIViewController+VSDependencyManager.h"
#import "VSDependencyManager.h"
@implementation UIViewController (VSDependencyManager)
- (void)VSDealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[VSDependencyManager shareInstance] removeObserver:self];
    [self VSDealloc];
}
@end
