//
//  ZHWorker.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHObservableObject.h"

#import "ZHMoneyTransferProtocol.h"
#import "ZHWorkersDelegate.h"

#import <Foundation/Foundation.h>

typedef NS_ENUM(uint8_t, ZHWorkerState) {
    ZHWorkerStateFree,
    ZHWorkerStateBusy,
    ZHWorkerStatePending
};

@protocol ZHWorkerObserver <NSObject>

@optional
- (void)workerDidBecomeReadyForProcessing:(id)worker;
- (void)workerDidBecomeFree:(id)worker;
- (void)workerDidBecomeBusy:(id)worker;

@end

@interface ZHWorker : ZHObservableObject <ZHMoneyTransferProtocol, ZHWorkersDelegate>
@property (nonatomic, assign) float     income;
@property (nonatomic, assign) NSInteger yearsOfExperience;

@property (nonatomic, assign)   BOOL        busy;
@property (nonatomic, assign)   id<ZHWorkersDelegate>  delegate;

- (void)processObject:(id)object;
- (void)performWorkWithObject:(id)object;
- (void)finishProcessing;

@end

