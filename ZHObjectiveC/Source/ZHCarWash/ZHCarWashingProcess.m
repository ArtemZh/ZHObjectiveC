//
//  ZHCarWashingProcess.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 22.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCarWashingProcess.h"

#import "ZHCarWasher.h"
#import "ZHQueue.h"
#import "ZHCar.h"
#import "ZHAccountant.h"
#import "ZHBoss.h"

#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"
#import "ZHObservableObject.h"
#import "ZHWorkersDispatcher.h"

static const NSUInteger kZHWashersCount  = 4;
static const NSUInteger kZHAccountantsCount = 2;
static const NSUInteger kZHBossCount = 1;

static NSString *kZHWasherName       = @"CarWasher";
static NSString *kZHAccountantName   = @"Accountant";
static NSString *kZHBossName         = @"Boss";


typedef NSArray *(^ZHWorkersFactory)(Class class, NSUInteger count, id observer, NSString *name);

@interface ZHCarWashingProcess ()
@property (nonatomic, retain) ZHWorkersDispatcher *washersDispatcher;
@property (nonatomic, retain) ZHWorkersDispatcher *accountansDispatcher;
@property (nonatomic, retain) ZHWorkersDispatcher *bossDispatcher;


- (void)initInfrastructure;

@end

@implementation ZHCarWashingProcess

#pragma mark -
#pragma mark Deallocation / Initialisation

- (void)dealloc {
    self.washersDispatcher = nil;
    self.accountansDispatcher = nil;
    self.bossDispatcher = nil;
    [self removeAllProcessors];
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    ZHWorkersFactory workersFactory = ^NSArray *(Class class, NSUInteger count, id observer, NSString *name) {
        __block NSUInteger iterator = 0;
        return [NSArray arrayWithObjectsCount:count block:^ {
            ZHWorker *worker = [class processorWithName:[NSString stringWithFormat:@"%@%lu",
                                                          name,
                                                          (unsigned long)++iterator]];
            
            [worker addObserver:observer];
            
            return worker;
            }];
    };

    self.bossDispatcher = [ZHWorkersDispatcher dispatcherWithProcessors:workersFactory([ZHBoss class],
                                                                                       kZHBossCount,
                                                                                       nil,
                                                                                       kZHBossName)];

    self.accountansDispatcher = [ZHWorkersDispatcher dispatcherWithProcessors:workersFactory([ZHAccountant class],
                                                                                             kZHAccountantsCount,
                                                                                             self.bossDispatcher,
                                                                                             kZHAccountantName)];

    self.washersDispatcher = [ZHWorkersDispatcher dispatcherWithProcessors:workersFactory([ZHCarWasher class],
                                                                                          kZHWashersCount,
                                                                                          self.accountansDispatcher,
                                                                                          kZHWasherName)];
}

#pragma mark -
#pragma mark Public Implementation



- (void)washCar:(ZHCar *)car {
    if (car) {
        [self.washersDispatcher processObject:car];
    }
    
}

- (void)removeAllProcessors {
    void (^removeObservers)(id collection, id observer) = ^(id collection, id observer) {
        for (ZHWorker *processor in collection) {
            [processor removeObserver:observer];
        }
    };
    
    ZHWorkersDispatcher *accountansDispatcher = self.accountansDispatcher;
    
    removeObservers(accountansDispatcher.processors, @[self.bossDispatcher]);
    removeObservers(self.washersDispatcher.processors, @[accountansDispatcher]);
}

@end
