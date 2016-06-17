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
} ZHIntegerGap;

typedef enum {
    ZHLost,
    ZHDrow,
    ZHWin
} ZHCompetitionResult;


NSUInteger ZHRandomPositivIntegerWithLimitValue(NSUInteger value);

NSInteger ZHRandomIntegerWithinGivenLimits(NSInteger value1, NSInteger value2);

BOOL ZHRandomBool(void);

ZHCompetitionResult ZHRandomСompetitionResult(void);

@interface ZHRandom : NSObject 

+ ZHRandomString:(NSMutableString *)string withSize:(NSUInteger)value;

@end