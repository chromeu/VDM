//
//  UIGestureRecognizer+VSDependencyManager.h
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (VSDependencyManager)
- (id)initDependencyWithTarget:(id)target action:(SEL)action;
- (void)addDependencyTarget:(id)target action:(SEL)action;
@end
