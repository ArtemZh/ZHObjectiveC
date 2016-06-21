//
//  ZHRandom.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRandom.h"



ZHIntegerRange ZHIntegerRangeCreate(NSInteger value1, NSInteger value2) {
    ZHIntegerRange range;
    
    range.min = MIN(value1, value2);
    range.max = MAX(value1, value2);
    
    return range;
}

NSInteger ZHRandomIntegerWithinGivenLimits(NSInteger value1, NSInteger value2) {
    ZHIntegerRange range = ZHIntegerRangeCreate(value1, value2);
    
    return range.min + (arc4random_uniform((u_int32_t)(range.max - range.min)));
}

NSUInteger ZHRandomIntegerWithLimitValue(NSUInteger value) {
    return ZHRandomIntegerWithinGivenLimits (0, value);
}

BOOL ZHRandomBool(void) {
    return arc4random() % 2;
}

ZHCompetitionResult ZHRandomСompetitionResult() {
    return arc4random_uniform(ZHWin);
}


