//
//  ZHCarWashingProcess.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 22.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBuilding.h"
#import "ZHCar.h"

#import <Foundation/Foundation.h>

@interface ZHCarWashingProcess : NSObject
- (void)washCar:(ZHCar *)car;

@end
