//
//  ZHRandom.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRandom.h"

NSInteger ZHRandomIntegerWithRange(NSInteger min, NSInteger max) {
    ZHIntegerRange range = ZHIntegerRangeCreate(min, max);
    
    return range.min + (arc4random_uniform((u_int32_t)(range.max - range.min)));
}

NSUInteger ZHRandomUnsignedInteget(NSUInteger value) {
    return ZHRandomIntegerWithRange(0, value);
}

BOOL ZHRandomBool(void) {
    return arc4random() % 2;
}



//for (int i = 0; i < 10; i++){
//    NSString *letter = [NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a'];
//    NSLog(@"%@", letter);
//}
