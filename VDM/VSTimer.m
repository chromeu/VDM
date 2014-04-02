//
//  VSTimer.m
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-27.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "VSTimer.h"
#import "VSDependencyManager.h"

@implementation NSTimer(VSTimer)

+ (NSTimer *)scheduledVSTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    NSTimer *timer = [self scheduledVSTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [[VSDependencyManager shareInstance] addObserver:aTarget source:timer];
    return timer;
}

@end
