//
//  NSTimer+ZHExtensions.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 06.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZHTimerExecutionBlock)(void);

@interface NSTimer (ZHExtensions)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block;
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block;

@end
