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
//@property (nonatomic, retain) ZHQueue      *queue;

- (void)finishProcessingOnMainThreadWithObject:(id)object;

@end

@implementation ZHWorker

#pragma mark Class methods

+ (instancetype)processorWithName:(NSString *)name {
    return [[[self alloc] initProcessorWithName:name] autorelease];
}

#pragma mark -
#pragma mark initialize / deallocate

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initProcessorWithName:name {
    self = [super init];
    self.name = name;
    
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
    float money = 0;
    @synchronized (owner) {
        money = owner.money;
        [owner giveMoney:money];
    }
    
    [self receiveMoney:money];
}

- (void)processObject:(id)object {
    @synchronized (self) {
        if (self.state == ZHWorkerStateFree) {
            self.state = ZHWorkerStateBusy;
            [self performSelectorInBackground:@selector(processObjectInBackground:) withObject:object];
        }
    }
}

- (void)processObjectInBackground:(id)object {
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
    
    [self finishProcessing];
}

- (void)finishProcessingObject:(ZHWorker *)worker {
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
