//
//  ZHAccountant.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHAccountant.h"

@implementation ZHAccountant

- (void)calculateMoney {
    NSLog(@"Calculated Money %f", self.money);
}

- (void)processObject:(id)object {
    [self takeMoneyFromObject:object];
    [self calculateMoney];
}

@end
