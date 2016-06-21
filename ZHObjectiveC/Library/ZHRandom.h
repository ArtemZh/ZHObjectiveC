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

typedef enum {
    ZHLost,
    ZHDrow,
    ZHWin
} ZHCompetitionResult;


NSUInteger ZHRandomIntegerWithLimitValue(NSUInteger value);

NSInteger ZHRandomIntegerWithinGivenLimits(NSInteger value1, NSInteger value2);

BOOL ZHRandomBool(void);

ZHCompetitionResult ZHRandomСompetitionResult(void);

