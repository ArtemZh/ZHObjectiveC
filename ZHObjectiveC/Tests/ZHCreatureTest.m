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

static const NSUInteger kZHAmountOfChildren = 2;

@implementation ZHCreatureTest

-(void)ZHCreatureTest {
    NSMutableArray *creatures = [NSMutableArray object];
    
    ZHCreatureMale *creature = [ZHCreatureMale object];
    creature.name = @"Papa";
    [creatures addObject:creature];
    
    creature = [ZHCreatureMale object];
    creature.name = @"Papa2";
    [creatures addObject:creature];
    
    ZHCreatureFemale *creature2 = [ZHCreatureFemale object];
    creature2.name = @"Mama";
    [creatures addObject:creature2];
    
    creature2 = [ZHCreatureFemale object];
    creature2.name = @"Mama2";
    [creatures addObject:creature2];
    
//    for (uint8_t iterator = 0; iterator < creatures.count - 1; iterator++) {
//        for (uint8_t i = 0; i < kZHAmountOfChildren; iterator++) {
//            [creature addChild:creatures[iterator]];
//        }
//    }
    
    for (uint8_t iterator = 0; iterator < creatures.count - 1; iterator++) {
        [creature addChild:creatures[iterator]];
    }
    
    
    for (ZHCreature *creature in creatures) {
        [creature familySayHi];
    }
    
    for (ZHCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
}

@end
