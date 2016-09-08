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

typedef void (^ZHBlock)(void);


@implementation NSTimer (ZHExtensions)

#pragma mark -
#pragma mark Public implementations

//+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block {
//    if (!block) {
//        return nil;
//    }
//    
//    id timerSupport = [ZHTimerSupport objectWithBlock:block];
//    
//    
//    NSTimer *timer =[self scheduledTimerWithTimeInterval:interval
//                                                  target:timerSupport
//                                                selector:@selector(onTimer:)
//                                                userInfo:nil
//                                                 repeats:repeats];
//    return timer;
//}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block {
    
    id timerSupport = [ZHTimerSupport objectWithBlock:block];
    
    
    NSTimer *timer =[self timerWithTimeInterval:interval
                                         target:timerSupport
                                       selector:@selector(onTimer:)
                                       userInfo:nil
                                        repeats:repeats];
    return timer;
}


+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block {
    if (!block) {
        return nil;
    }
    
    NSTimer *timer =[self timerWithTimeInterval:interval repeats:repeats block:(void(^)())block];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    return timer;
}


//- (void)addTimer:(NSTimer *)timer
//         forMode:(NSRunLoopMode)mode;


@end
