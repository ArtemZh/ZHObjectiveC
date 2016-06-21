//
//  ZHCreatureFemale.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreatureMale.h"

static NSString * const kZHDefoultChildName = @"child";
@interface ZHCreatureFemale : ZHCreature

- (ZHCreature *)giveBirth;

@end
