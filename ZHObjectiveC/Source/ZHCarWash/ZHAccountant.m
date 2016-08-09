//
//  ZHAccountant.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHAccountant.h"
#import "ZHCarWasher.h"

@implementation ZHAccountant

- (void)calculateMoney {
    NSLog(@"Calculated Money %f", self.money);
}

- (void)performWorkWithObject:(ZHCarWasher *)object {
    [self takeMoneyFromObject:object];
    object.state = ZHWorkerStateFree;
    [self calculateMoney];
}

- (void)workerDidBecomeReadyForProcessing:(id)washer {
    [self processObject:washer];
}



@end
