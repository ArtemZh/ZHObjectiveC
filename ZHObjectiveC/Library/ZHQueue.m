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
@property (nonatomic, retain) NSMutableArray *objectsQueue;

@end

@implementation ZHQueue

@dynamic objectsCount;

#pragma mark -
#pragma mark Initialization and deallocation

- (void)dealloc {
    self.objectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.objectsQueue = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.objectsQueue.count;
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueue:(id)object {
    if (![self.objectsQueue containsObject:object]) {
        [self.objectsQueue addObject:object];
    }
}

- (id)dequeue {
    NSMutableArray *objects = self.objectsQueue;
    id object = [objects firstObject];
    [self.objectsQueue removeObject:object];
    
    return object;
}

@end
