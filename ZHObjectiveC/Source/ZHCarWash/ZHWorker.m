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
    [owner giveMoney:money];
    [self receiveMoney:money];
}

- (void)startProcessingObject:(id)object {
   // NSLog(@"%@ self performSelectorInBackground", self.name);
    [self performWorkWithObject:object];
    [self performSelectorOnMainThread:@selector(finishProcessingOnMainThreadWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}
- (void)processObject:(id)object {
   // NSLog(@"%@ self.state = ZHWorkerStateBusy", self.name);
    self.state = ZHWorkerStateBusy;
    [self performSelectorInBackground:@selector(startProcessingObject:) withObject:object];
    [self finishProcessing];
}

- (void)finishProcessingOnMainThreadWithObject:(id)object {
    @synchronized (object) {
        [self finishProcessingObject:object];
    }
    @synchronized(self) {
        ZHQueue *objectsQueue = self.queue;
        if ([objectsQueue count] > 0 ) {
            id object = [objectsQueue dequeue];
            
            [self performSelectorInBackground:@selector(startProcessingObject:) withObject:object];
        } else {
            [self finishProcessing];
        }
    }
}

- (void)finishProcessingObject:(ZHWorker *)worker {
   // NSLog(@"%@ self.state = ZHWorkerStateFree", self.name);
    self.state = ZHWorkerStateFree;
}

- (void)finishProcessing {
  //  NSLog(@"%@ self.state = ZHWorkerStateReadyForProcessing", self.name);
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

@end
