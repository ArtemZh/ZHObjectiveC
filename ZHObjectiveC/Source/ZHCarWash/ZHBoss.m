//
//  ZHBoss.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBoss.h"
#import "ZHAccountant.h"

@implementation ZHBoss

- (void)calculateProfit {
    NSLog(@"Profit = %f", self.money);
}

- (void)performWorkWithObject:(ZHAccountant *)object {
    [self takeMoneyFromObject:object];
    object.state = ZHWorkerStateFree;
    [self calculateProfit];
}

- (void)workerDidBecomeReadyForProcessing:(id)accountant {
    [self processObject:accountant];
}

- (void)finishProcessing {
    self.state = ZHWorkerStateFree;
}


@end
