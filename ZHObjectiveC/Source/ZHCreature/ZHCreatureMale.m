//
//  ZHCreatureMale.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreatureMale.h"

@implementation ZHCreatureMale

- (void)goFight {
    NSLog(@"%@ - Go fight", self.name);
}

- (void)performGenderSpecificOperation {
    [self goFight];
}

@end
