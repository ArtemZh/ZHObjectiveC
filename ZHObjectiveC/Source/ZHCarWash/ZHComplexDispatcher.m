//
//  ZHComplexDispatcher.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 26.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHComplexDispatcher.h"

#import "ZHCar.h"
#import "ZHCarWashingProcess.h"

#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"

@interface ZHCarWashingProcess ()
@property (nonatomic, retain) ZHCarWashingProcess    *complex;
@property (nonatomic, assign) NSTimer                *timer;
@property (nonatomic, assign, getter=isRunning) BOOL running;


@end

@implementation


#pragma mark -
#pragma mark Initializations / Deallocations

- (void)dealloc {
 //
}

#pragma mark -
#pragma mark Accessors

@end
