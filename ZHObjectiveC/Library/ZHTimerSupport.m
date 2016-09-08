//
//  ZHTimerSupport.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 06.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTimerSupport.h"

@interface ZHTimerSupport ()
@property (nonatomic, copy)  ZHTimerSupportingBlock   block;

- (instancetype)initWithBlock:(void(^)())block;

@end

@implementation ZHTimerSupport

#pragma mark -
#pragma mark Class methods

+ (instancetype)objectWithBlock:(void(^)())block {
    return [[[self alloc] initWithBlock:block] autorelease];
}

#pragma mark -
#pragma mark Initializations / Deallocations

- (void)dealloc {
    self.block = nil;
    
    [super dealloc];
}

- (instancetype)initWithBlock:(void(^)())block {
    self = [super init];
    self.block = block;
    
    return self;
}


#pragma mark -
#pragma mark Public implementations

- (void)onTimer:(NSTimer *)timer {
    ZHTimerSupportingBlock block = self.block;
    
    block();
}

@end
