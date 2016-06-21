//
//  ZHCarWasher.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCarWasher.h"

@implementation ZHCarWasher

- (void)washCar:(ZHCar *)car {
    [self takeMoneyFromObject:car];
    car.status = ZHCarClean;
}

- (void)processObject:(id)object {
    [self washCar:object];
}

@end
