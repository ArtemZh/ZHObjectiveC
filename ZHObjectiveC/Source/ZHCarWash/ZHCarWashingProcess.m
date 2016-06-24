//
//  ZHCarWashingProcess.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 22.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//
#import "ZHCarWashingProcess.h"

#import "NSObject+ZHExtension.h"
#import "ZHBuilding.h"
#import "ZHRoom.h"
#import "ZHBox.h"
#import "ZHCarWasher.h"

@interface ZHCarWashingProcess ()
@property (nonatomic, retain) ZHBuilding        *washBuilding;
@property (nonatomic, retain) ZHBuilding        *officeBuilding;

- (void)initInfrastructure;

@end

@implementation ZHCarWashingProcess

#pragma mark -
#pragma mark Deallocation / Initialisation

- (void)dealloc {
    self.officeBuilding = nil;
    self.washBuilding = nil;
    
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
    
    ZHBuilding *officeBuilding = self.officeBuilding;
    ZHBuilding *washBuilding = self.washBuilding;
    ZHBox *box = [ZHBox object];
    ZHRoom *room = [[ZHRoom alloc] init];
    
    [box addWorker:washer];
    [washBuilding addRoom:box];
    
    [room addWorker:accountant];
    [room addWorker:boss];
    [officeBuilding addRoom:room];

}

#pragma mark -
#pragma mark Public Implementation

- (void)washCar:(id)car {
// find free box
// find free worker
//    [washer processObject:car];
}



@end
