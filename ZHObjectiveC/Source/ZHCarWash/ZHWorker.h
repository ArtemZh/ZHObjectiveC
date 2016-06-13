//
//  ZHWorker.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHMoneyTransferProtocol.h"

#import <Foundation/Foundation.h>

@interface ZHWorker : NSObject <ZHMoneyTransferProtocol>
@property (nonatomic, assign) float     income;
@property (nonatomic, assign) NSInteger yearsOfExperience;

@end

