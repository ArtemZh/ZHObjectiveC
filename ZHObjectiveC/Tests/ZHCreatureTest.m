//
//  ZHCreatureTest.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 16.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreature.h"
#import "ZHCreatureTest.h"
#import "ZHCreatureMale.h"
#import "ZHCreatureFemale.h"

#import <Foundation/Foundation.h>

@implementation ZHCreatureTest

-(void)ZHCreatureTest {
    NSMutableArray *creatures = [NSMutableArray object];
    
    ZHCreature *creature = [ZHCreatureMale object];
    creature.name = @"Papa";
    [creatures addObject:creature];
    
    creature = [ZHCreatureMale object];
    creature.name = @"Papa2";
    [creatures addObject:creature];
    
    creature = [ZHCreatureFemale object];
    creature.name = @"Mama";
    [creatures addObject:creature];
    
    creature = [ZHCreatureFemale object];
    creature.name = @"Mama2";
    [creatures addObject:creature];
    
//    for (uint8_t iterator = 0; iterator < creatures.count - 1; iterator++) {
//        [creature addChild:creatures[iterator]];
//    }
    
    for (ZHCreature *creature in creatures) {
        [creature addChild:creature];
    }
    
    for (ZHCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
    
    for (ZHCreature *creature in creatures) {
        [creature familySayHi];
    }
}

@end
