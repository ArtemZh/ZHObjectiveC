//
//  ZHBoss.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBoss.h"

@implementation ZHBoss

- (void)calculateProfit {
    NSLog(@"Profit = %f", self.money);
}

- (void)processObject:(id)object {
    [self takeMoneyFromObject:object];
    [self calculateProfit];
}

- (void)workerDidFinishProcessingObject:(id)worker {
    [self processObject:worker];
}


@end
