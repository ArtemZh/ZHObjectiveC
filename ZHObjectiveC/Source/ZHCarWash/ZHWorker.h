//
//  ZHWorker.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHMoneyTransferProtocol.h"
#import "ZHWorkersDelegate.h"

#import <Foundation/Foundation.h>

@interface ZHWorker : NSObject <ZHMoneyTransferProtocol, ZHWorkersDelegate>
@property (nonatomic, assign) float     income;
@property (nonatomic, assign) NSInteger yearsOfExperience;

@property (nonatomic, assign)   BOOL        busy;
@property (nonatomic, assign)   id<ZHWorkersDelegate>  delegate;

- (void)processObject:(id)object;
- (void)performWorkWithObject:(id)object;

@end

