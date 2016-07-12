//
//  ZHCarWashingProcess.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 22.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCarWashingProcess.h"

#import "ZHBuilding.h"
#import "ZHRoom.h"
#import "ZHBox.h"
#import "ZHCarWasher.h"
#import "ZHQueue.h"
#import "ZHCar.h"
#import "ZHAccountant.h"
#import "ZHBoss.h"

#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"

@interface ZHCarWashingProcess ()
@property (nonatomic, retain) ZHBuilding        *washBuilding;
@property (nonatomic, retain) ZHBuilding        *officeBuilding;
@property (nonatomic, retain) ZHQueue           *carsQueue;

- (void)initInfrastructure;

- (id)freeWasher;
- (id)freeAccountant;
- (id)freeDirector;

- (id)reservedFreeWorkerWithClass:(Class)class;
- (ZHBuilding *)buildingForWorkerWithClass:(Class)class;

- (ZHBox *)freeCarWashRoom;

@end

@implementation ZHCarWashingProcess

#pragma mark -
#pragma mark Deallocation / Initialisation

- (void)dealloc {
    self.officeBuilding = nil;
    self.washBuilding = nil;
    self.carsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.carsQueue = [ZHQueue object];
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    ZHCarWasher *washer = [ZHCarWasher object];
    ZHAccountant *accountant = [ZHAccountant object];
    ZHBoss *boss = [ZHBoss object];
    
    ZHBuilding *officeBuilding = [ZHBuilding object];
    self.officeBuilding = officeBuilding;
    
    ZHBuilding *washBuilding = [ZHBuilding object];
    self.washBuilding = washBuilding;
    
    ZHBox *box = [ZHBox object];
    ZHRoom *room = [ZHRoom object];
    
    [box addWorker:washer];
    [washBuilding addRoom:box];
    
    [room addWorker:accountant];
    [room addWorker:boss];
    [officeBuilding addRoom:room];
    
    washer.delegate = accountant;
    accountant.delegate = boss;
}

#pragma mark -
#pragma mark Public Implementation

- (id)freeWasher {
    return [self reservedFreeWorkerWithClass:[ZHCarWasher class]];
}

- (id)freeAccountant {
    return [self reservedFreeWorkerWithClass:[ZHAccountant class]];
}

- (id)freeDirector {
    return [self reservedFreeWorkerWithClass:[ZHBoss class]];
}

- (id)reservedFreeWorkerWithClass:(Class)class {
    NSArray *workers = [[self buildingForWorkerWithClass:class] workersWithClass:class];
    workers = [workers filteredArrayUsingBlock:^BOOL(ZHWorker *worker) { return !worker.busy; }];
    ZHWorker *freeWorker = [workers firstObject];
    
    freeWorker.busy = YES;
    
    return freeWorker;
}

- (ZHBuilding *)buildingForWorkerWithClass:(Class)class {
    return [class isSubclassOfClass:[ZHCarWasher class]] ? self.washBuilding : self.officeBuilding;
}

- (ZHBox *)freeCarWashRoom {
    NSArray *rooms = [self.washBuilding roomsWithClass:[ZHBox class]];
    rooms = [rooms filteredArrayUsingBlock:^BOOL(ZHBox *room) { return !room.cars; }];
    
    return [rooms firstObject];
}

- (void)washCar:(ZHCar *)car {
    ZHQueue *carsQueue = self.carsQueue;
    [carsQueue enqueue:car];
    //test
    NSLog(@"Cars in carsQueue = %lu", carsQueue.count);
    
    ZHCar *carToWash = nil;
    while ((carToWash = [carsQueue dequeue])) {
        
        ZHCarWasher *washer = [self freeWasher];
        ZHAccountant *accountant = [self freeAccountant];
        ZHBoss *boss = [self freeDirector];
        ZHBox *box = [self freeCarWashRoom];
        
        [box addCar:carToWash];
        [washer performWorkWithObject:carToWash];
        [box removeCar:carToWash];
        
        //[accountant performWorkWithObject:washer];
        //[boss performWorkWithObject:accountant];
    }
    
}


@end
