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
@property (nonatomic, retain) ZHQueue   *objectsForProcess;
@property (nonatomic, retain) ZHQueue   *freeProcessors;

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
    self.objectsForProcess = nil;
    self.freeProcessors = nil;
    self.mutableProcessors = nil;
    
    [super dealloc];
}

- (instancetype)initWithProcessors:(NSArray *)processors {
    self = [super init];
    
    self.objectsForProcess = [ZHQueue object];
    
    self.mutableProcessors = [NSMutableArray array];
    [self addProcessors:processors];
    
    ZHQueue *freeProcessors = [ZHQueue object];
    self.freeProcessors = freeProcessors;
    [freeProcessors enqueueObjects:processors];
    
    return self;
}

#pragma mark -
#pragma mark Public implementations

- (void)processObject:(id)object {
    if (object) {
        ZHWorker *worker = [self.freeProcessors dequeue];
        if (worker) {
            [worker processObject:object];
        } else {
            [self.objectsForProcess enqueue:object];
        }
    }
}

- (void)addProcessor:(id)processor {
    NSMutableArray *mutableProcessors = self.mutableProcessors;
    [mutableProcessors addObject:processor];
}

- (void)removeProcessor:(id)processor {
    NSMutableArray *mutableProcessors = self.mutableProcessors;
    [mutableProcessors removeObject:processor];
}

- (void)addProcessors:(NSArray *)processors {
    for (ZHWorker *processor in processors) {
        
        [processor addObserver:self];
        [self addProcessor:processor];
    }
}

- (void)removeProcessors:(NSArray *)processors {
    for (ZHWorker *processor in processors) {
        
        [processor removeObserver:self];
        [self removeProcessor:processor];
    }
}

#pragma mark -
#pragma mark ZHWorkersObserver methods

- (void)workerDidBecomeFree:(ZHWorker *)processor {
    [self.freeProcessors enqueue:processor];
    [self processObject:[self.objectsForProcess dequeue]];
}

- (void)workerDidBecomeReadyForProcessing:(id)object {
    [self processObject:object];
}


@end