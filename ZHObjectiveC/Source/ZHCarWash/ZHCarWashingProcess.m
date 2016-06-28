//
//  ZHCarWashingProcess.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 22.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCarWashingProcess.h"

#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"

#import "ZHBuilding.h"
#import "ZHRoom.h"
#import "ZHBox.h"
#import "ZHCarWasher.h"
#import "ZHQueue.h"
#import "ZHCar.h"


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
    [self initInfrastructure];
    
    return self;
}

- (void)initInfrastructure {
    ZHCarWasher *washer = [ZHCarWasher object];
    ZHAccountant *accountant = [ZHAccountant object];
    ZHBoss *boss = [ZHBoss object];
    
    self.officeBuilding = [ZHBuilding object];
    self.washBuilding = [ZHBuilding object];
    
    
    ZHBox *box = [ZHBox object];
    ZHRoom *room = [ZHRoom object];
    
    [box addWorker:washer];
    [self.washBuilding addRoom:box];
    
    [room addWorker:accountant];
    [room addWorker:boss];
    [self.officeBuilding addRoom:room];

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
    workers = [workers filteredUsingBlock:^BOOL(ZHWorker *worker) { return !worker.busy; }];
    ZHWorker *freeWorker = [workers firstObject];
    
    freeWorker.busy = YES;
    
    return freeWorker;
}

- (ZHBuilding *)buildingForWorkerWithClass:(Class)class {
    return [class isSubclassOfClass:[ZHCarWasher class]] ? self.washBuilding : self.officeBuilding;
}

- (ZHBox *)freeCarWashRoom {
    NSArray *rooms = [self.washBuilding roomsWithClass:[ZHBox class]];
    rooms = [rooms filteredUsingBlock:^BOOL(ZHBox *room) { return !room.cars; }];
    
    return [rooms firstObject];
}

- (void)washCar:(ZHCar*)car {
    ZHQueue *carsQueue = self.carsQueue;
    [carsQueue enqueue:car];
    
    ZHBox *cars = nil;
    while ((cars = [carsQueue dequeue])) {
        
        ZHCarWasher *washer = [self freeWasher];
        
        ZHBox *box = [self freeCarWashRoom];
        [box addCar:car];
        
        [washer processObject:car];
        
        box.cars = nil;
        
    }
}

@end
