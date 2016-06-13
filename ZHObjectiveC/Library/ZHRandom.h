//
//  ZHRandom.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct {
    NSInteger min;
    NSInteger max;
} ZHIntegerRange;

static inline
ZHIntegerRange ZHIntegerRangeCreate(NSInteger firstValue, NSInteger secondValue) {
    ZHIntegerRange range;
    range.min = MIN(firstValue, secondValue);
    range.max = MAX(firstValue, secondValue);
    
    return range;
}
// genarate random number between (min, max -1)
NSInteger ZHRandomIntegerWithRange(NSInteger min, NSInteger max);

// genarate random number between (min, max -1)
NSUInteger ZHRandomUnsignedInteget(NSUInteger value);

BOOL ZHRandomBool(void);


