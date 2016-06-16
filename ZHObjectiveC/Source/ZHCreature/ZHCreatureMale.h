//
//  ZHCreatureMale.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreature.h"

typedef enum {
    ZHCreatureLost,
    ZHCreatureDrow,
    ZHCreatureWin
} ZHCreatureWarResult;

@interface ZHCreatureMale : ZHCreature

@property (nonatomic, assign)   NSUInteger              winsCount;

- (void)goFight;
- (void)performGenderSpecificOperation;


@end
