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

static const NSUInteger kZHWashersCount  = 1;
static const NSString *kZHWasherName = @"CarWasher";

@interface ZHCarWashingProcess ()
@property (nonatomic, retain) ZHBoss            *boss;
@property (nonatomic, retain) ZHAccountant      *accountant;
@property (nonatomic, retain) NSMutableArray    *washers;
@property (nonatomic, retain) ZHQueue           *carsQueue;
@property (nonatomic, retain) ZHQueue           *washersQueue;

- (void)initInfrastructure;

@end

@implementation ZHCarWashingProcess

#pragma mark -
#pragma mark Deallocation / Initialisation

- (void)dealloc {
 //   [self removeWorkersObservers];
    self.boss = nil;
    self.accountant = nil;
    self.washers = nil;
    self.carsQueue = nil;
    self.washersQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    [self initWorkers];
    [self initQueues];
}

- (void)initWorkers {
    self.washers = [NSMutableArray array];
    ZHBoss *boss = [ZHBoss object];
    boss.name = @"boss";
    self.boss = boss;
    ZHAccountant *accountant = [ZHAccountant object];
    accountant.name = @"accountant";
    self.accountant = accountant;
    [accountant addObserver:boss];
    
    __block NSUInteger iterator = 0;
    NSArray *washerObservers = @[accountant, self];
    self.washers = [NSMutableArray arrayWithObjectsCount:kZHWashersCount block:^{
        ZHCarWasher *washer = [ZHCarWasher object];
        [washer addObservers:washerObservers];
        washer.name = [NSString stringWithFormat:@"%@%lu", kZHWasherName, (unsigned long)iterator++];
        
        return washer;
    }];
}

- (void)initQueues {
    ZHQueue *washersQueue = [ZHQueue object];
    self.washersQueue = washersQueue;
    [washersQueue enqueueObjects:self.washers];
    self.carsQueue = [ZHQueue object];
}

#pragma mark -
#pragma mark Public Implementation



- (void)washCar:(ZHCar *)car {
    if (car) {
        ZHCarWasher *washer = [self.washersQueue dequeue];
        if (washer) {
            [washer processObject:car];
        } else {
            [self.carsQueue enqueue:car];
        }
    }
    
}

- (void)workerDidBecomeFree:(ZHWorker *)worker {
    ZHCar *car = [self.carsQueue dequeue];
    if (car) {
        [worker processObject:car];
    } else {
        [self.washersQueue enqueue:worker];
    }
}

@end
