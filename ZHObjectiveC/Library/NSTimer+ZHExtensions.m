//
//  NSTimer+ZHExtensions.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 06.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "NSTimer+ZHExtensions.h"

#import "ZHTimerSupport.h"

#import "NSObject+ZHExtension.h"

typedef void (^BPVBlock)(void);


@implementation NSTimer (BPVExtensions)

#pragma mark -
#pragma mark Public implementations

+ (instancetype)timerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block {
    if (!block) {
        return nil;
    }
    
    id object = [ZHTimerSupport objectWithBlock:block];
    
    
    NSTimer *timer =[self scheduledTimerWithTimeInterval:interval
                                                  target:object
                                                selector:@selector(startTimer:)
                                                userInfo:nil
                                                 repeats:repeats];
    return timer;
}

@end
