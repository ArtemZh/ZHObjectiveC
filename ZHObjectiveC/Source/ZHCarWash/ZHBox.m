//
//  ZHBox.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBox.h"
#import "NSObject+ZHExtension.h"




@interface ZHBox ()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation ZHBox

@dynamic cars;
@dynamic occupied;

#pragma mark -
#pragma mark initialize / deallocate

- (instancetype)init {
    self = [super init];
    self.mutableCars = [NSMutableArray object];
//    ZHCarWasher *washer = [ZHCarWasher object];
//    [self addWorker:washer];
    
    return self;
}

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

- (BOOL)isOccupied {
    return self.cars.count >= kZHMaxCarCapacity;
}

#pragma mark -
#pragma mark Public methods

- (void)addCar:(ZHCar *)car {
    NSMutableArray *cars = self.mutableCars;
    if (!self.isOccupied && ![cars containsObject:car]) {
        [cars addObject:car];
    }
}

- (void)removeCar:(ZHCar *)car {
    [self.mutableCars removeObject:car];
}

@end
