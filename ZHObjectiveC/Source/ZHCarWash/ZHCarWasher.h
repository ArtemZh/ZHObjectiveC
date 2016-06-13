//
//  ZHCarWasher.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHWorker.h"
#import "ZHCar.h"
#import "ZHAccountant.h"

@interface ZHCarWasher : ZHWorker

- (void)washCar:(ZHCar *)car;

@end
