//
//  ZHWorker.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHWorker.h"
#import "ZHRandom.h"
#import "ZHQueue.h"
#import "NSObject+ZHExtension.h"

@interface ZHWorker ()
@property (nonatomic, assign) float         money;
@property (nonatomic, retain) ZHQueue      *queue;

- (void)finishProcessingOnMainThreadWithObject:(id)object;

@end

@implementation ZHWorker

#pragma mark -
#pragma mark initialize / deallocate

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.queue = [ZHQueue object];
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)receiveMoney:(float)number {
    @synchronized (self) {
        self.money += number;
    }
    
}

- (void)giveMoney:(float)number {
    @synchronized (self) {
        self.money -= number;
    }
    
}

- (void)takeMoneyFromObject:(id<ZHMoneyTransferProtocol>)owner {
    float money = owner.money;
    [self receiveMoney:money];
    
    @synchronized (owner) {
        [owner giveMoney:money];
    }
    
    
}

- (void)processObject:(id)object {
    @synchronized (self) {
        if (self.state == ZHWorkerStateFree) {
            self.state = ZHWorkerStateBusy;
            [self performSelectorInBackground:@selector(processingObjectInBackground:) withObject:object];
        } else {
            [self.queue enqueue:object];
        }
    }
}

- (void)processingObjectInBackground:(id)object {
    NSLog(@"%@ performSelectorInBackground", self.name);
    [self performWorkWithObject:object];
    [self performSelectorOnMainThread:@selector(finishProcessingOnMainThreadWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)finishProcessingOnMainThreadWithObject:(id)object {
    @synchronized (object) {
        [self finishProcessingObject:object];
    }
    @synchronized(self) {
        
        ZHQueue *objectsQueue = self.queue;
        if ([objectsQueue count] > 0 ) {
            id object = [objectsQueue dequeue];
            
            [self performSelectorInBackground:@selector(processingObjectInBackground:) withObject:object];
        } else {
            [self finishProcessing];
        }
    }
}

- (void)finishProcessingObject:(ZHWorker *)worker {
    id object = nil;
    if (worker.state == ZHWorkerStateReadyForProcessing && (object = [worker.queue dequeue])) {
        worker.state = ZHWorkerStateBusy;
        [self performSelectorInBackground:@selector(processingObjectInBackground:) withObject:object];
        
        return;
    }
    
    NSLog(@"%@ self.state = StateFree", worker.name);
    worker.state = ZHWorkerStateFree;
}

- (void)finishProcessing {
    NSLog(@"%@ self.state = StateReadyForProcessing", self.name);
    self.state = ZHWorkerStateReadyForProcessing;
}

- (void)performWorkWithObject:(id)object {
    ///
}

- (void)workerDidBecomeReadyForProcessing:(id)object {
        [self processObject:object];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ZHWorkerStateFree:
            return @selector(workerDidBecomeFree:);
            
        case ZHWorkerStateReadyForProcessing:
            return @selector(workerDidBecomeReadyForProcessing:);
            
        case ZHWorkerStateBusy:
            return @selector(workerDidBecomeBusy:);
            
        default:
            return [super selectorForState:state];
    }
}

-(void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state == ZHWorkerStateFree && self.queue.count) {
            [super setState:ZHWorkerStateBusy];
            [self performSelectorInBackground:@selector(processingObjectInBackground:)
                                   withObject:[self.queue dequeue]];
            
            return;
        }
        
        [super setState:state];
    }
}

@end
