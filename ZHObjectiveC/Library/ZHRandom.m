//
//  ZHRandom.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRandom.h"



ZHIntegerGap ZHIntegerGapCreate(NSInteger value1, NSInteger value2) {
    ZHIntegerGap gap;
    
    gap.min = MIN(value1, value2);
    gap.max = MAX(value1, value2);
    
    return gap;
}

NSInteger ZHRandomIntegerWithinGivenLimits(NSInteger value1, NSInteger value2) {
    ZHIntegerGap gap = ZHIntegerGapCreate(value1, value2);
    
    return gap.min + (arc4random_uniform((u_int32_t)(gap.max - gap.min)));
}

NSUInteger ZHRandomPositivIntegerWithLimitValue(NSUInteger value) {
    return ZHRandomIntegerWithinGivenLimits (0, value);
}

BOOL ZHRandomBool(void) {
    return arc4random() % 2;
}

ZHCompetitionResult ZHRandomСompetitionResult() {
    return arc4random_uniform(ZHWin);
}

@implementation ZHRandom

+ ZHRandomString:(NSMutableString *)string withSize:(NSUInteger)value {
    NSMutableString *string2 = [NSMutableString stringWithCapacity:value];
    
    for (int i = 0; i < value; i++){
        
        NSString *symbols = [NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a'];
        [string2 appendString:symbols];
    }

    NSLog(@"%@", string2);
    
    return string;
}

@end