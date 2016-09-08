//
//  ZHTimerSupport.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 06.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^ZHTimerSupportingBlock)(void);

@interface ZHTimerSupport : NSObject

+ (instancetype)objectWithBlock:(void(^)())block;

- (void)onTimer:(NSTimer *)timer;

@end
