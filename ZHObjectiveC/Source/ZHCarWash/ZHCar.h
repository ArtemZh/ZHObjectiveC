//
//  ZHCar.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHMoneyTransferProtocol.h"

#import <Foundation/Foundation.h>

typedef enum {
    ZHCarDirty,
    ZHCarClean
} ZHCarStatus;

@interface ZHCar : NSObject<ZHMoneyTransferProtocol>
@property (nonatomic, assign) ZHCarStatus status;


@end
