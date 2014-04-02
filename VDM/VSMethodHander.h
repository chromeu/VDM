//
//  VSMethodHander.h
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSMethodHander : NSObject


+ (VSMethodHander *)shareInstance;
- (void)replaceObjectSEL:(SEL)newSEL origSEL:(SEL)origSEL;
//替换实例方法
- (void)replaceClass:(Class)className newSEL:(SEL)newSEL origSEL:(SEL)origSEL;
//替换类方法
- (void)replaceClassMethod:(Class)className newSEL:(SEL)newSEL origSEL:(SEL)origSEL;
@end
