//
//  ZHCreatureFemale.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreatureMale.h"


@interface ZHCreatureFemale : ZHCreature

- (ZHCreature *)giveBirthWithFather:(ZHCreatureMale *)father andChildName:(NSString *)childName;
- (void)performGenderSpecificOperation;
- (ZHCreature *)giveBirth;

@end
