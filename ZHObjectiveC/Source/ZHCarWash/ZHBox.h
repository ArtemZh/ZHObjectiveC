//
//  ZHBox.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRoom.h"
#import "ZHCarWasher.h"
#import "ZHCar.h"
#import "ZHConstants.h"

@interface ZHBox : ZHRoom
@property (nonatomic, retain)    NSArray *cars;
@property (nonatomic, readonly, getter = isOccupied)    BOOL    occupied;

- (void)addCar:(ZHCar *)car;
- (void)removeCar:(ZHCar *)car;

@end
