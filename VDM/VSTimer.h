//
//  VSTimer.h
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-27.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NSTimer(VSTimer)

+ (NSTimer *)scheduledVSTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

@end
