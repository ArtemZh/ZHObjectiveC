//
//  ZHCreatureFemale.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//



#import "ZHCreatureFemale.h"

@implementation ZHCreatureFemale

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

- (ZHCreature *)giveBirth {
    NSLog(@"%@ - Give birth" , self.name);
    ZHCreature *child = [ZHCreature object];
    [self addChild:child];
    child.name = kZHDefaultChildName;
    return child;
}

@end
