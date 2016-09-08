//
//  ZHWorkersDispatcher.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 16.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHWorkersDispatcher.h"
#import "ZHQueue.h"
#import "ZHWorker.h"
#import "NSObject+ZHExtension.h"

@interface ZHWorkersDispatcher ()

@property (nonatomic, retain) NSMutableArray    *mutableProcessors;
@property (nonatomic, retain) ZHQueue           *objectsQueue;
@property (nonatomic, retain) ZHQueue           *freeProcessors;

- (void)addProcessors:(NSArray *)processors;

@end

@implementation ZHWorkersDispatcher

#pragma mark -
#pragma mark Class methods

+ (instancetype)dispatcherWithProcessors:(NSArray *)processors {
    return [[[self alloc] initWithProcessors:processors] autorelease];
}

#pragma mark -
#pragma mark Initializations / Deallocations

- (void)dealloc {
    self.objectsQueue = nil;
    self.freeProcessors = nil;
    
    [self removeProcessors:self.processors];
    self.mutableProcessors = nil;
    
    [super dealloc];
}

- (instancetype)initWithProcessors:(NSArray *)processors {
    self = [super init];
    
    self.objectsQueue = [ZHQueue object];
    
    self.mutableProcessors = [NSMutableArray array];
    [self addProcessors:processors];
    [self.freeProcessors enqueueObjects:self.mutableProcessors];
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)processors {
    NSMutableArray *mutableProcessors = self.mutableProcessors;
    @synchronized (mutableProcessors) {
        return [[mutableProcessors copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public implementations

- (void)processObject:(id)object {
    if (object) {
        ZHWorker *worker = [self.freeProcessors dequeue];
        if (worker) {
            [worker processObject:object];
        } else {
            [self.objectsQueue enqueue:object];
        }
    }
}

- (void)addProcessor:(id)processor {
    NSMutableArray *mutableProcessors = self.mutableProcessors;
    @synchronized (mutableProcessors) {
        [mutableProcessors addObject:processor];
        [processor addObserver:self];
        
    }
} 

- (void)removeProcessor:(id)processor {
    NSMutableArray *mutableProcessors = self.mutableProcessors;
    @synchronized (mutableProcessors) {
        [mutableProcessors removeObject:processor];
        [processor removeObserver:self];
        
    }
    
}

- (void)addProcessors:(NSArray *)processors {
    @synchronized (self.mutableProcessors) {
        for (ZHWorker *processor in processors) {

            [self addProcessor:processor];
        }
    }
}

- (void)removeProcessors:(NSArray *)processors {
    for (ZHWorker *processor in processors) {
        
        [self removeProcessor:processor];
    }
}

#pragma mark -
#pragma mark Private implementations

- (BOOL)containsProcessor:(id)processor {
    return [self.processors containsObject:processor];
}


#pragma mark -
#pragma mark ZHWorkersObserver methods

- (void)workerDidBecomeFree:(ZHWorker *)processor {
    if ([self containsProcessor:processor]) {
        [self.freeProcessors enqueue:processor];
        [self processObject:[self.objectsQueue dequeue]];
    }
}

- (void)workerDidBecomeReadyForProcessing:(id)object {
    if (![self containsProcessor:object]) {
        [self processObject:object];
    }
}


@end