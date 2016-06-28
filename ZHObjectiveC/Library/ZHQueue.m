//
//  ZHQueue.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 27.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHQueue.h"
#import "NSObject+ZHExtension.h"

@interface ZHQueue ()
@property (nonatomic, retain) NSMutableArray *queue;

@end

@implementation ZHQueue

@dynamic count;

#pragma mark -
#pragma mark Initialization and deallocation

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.queue = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.queue.count;
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueue:(id)object {
    if (![self.queue containsObject:object]) {
        [self.queue addObject:object];
    }
}

- (id)dequeue {
    NSMutableArray *objects = self.queue;
    if (!objects.count) {
        return nil;
    }
    
    id object = [[[objects firstObject] retain] autorelease];
    [self.queue removeObject:object];
    
    return object;
}

@end