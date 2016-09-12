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
    NSLog(@"Car washed  %f by %@ ", self.money, self.name);
}

- (void)performWorkWithObject:(id)object{
    NSLog(@"Car will wash  %f by %@ ", self.money, self.name);
    [self washCar:object];
}

- (void)finishProcessingObject:(ZHCar *)car {
    NSLog(@"Car wash by %@ ", self.name);
    car.status = ZHCarClean;
}

@end
