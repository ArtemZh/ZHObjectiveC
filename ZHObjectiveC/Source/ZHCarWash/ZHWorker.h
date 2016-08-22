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
    ZHWorkerStateReadyForProcessing
};

@protocol ZHWorkerObserver <NSObject>

@optional
- (void)workerDidBecomeReadyForProcessing:(id)worker;
- (void)workerDidBecomeFree:(id)worker;
- (void)workerDidBecomeBusy:(id)worker;

@end

@interface ZHWorker : ZHObservableObject <ZHMoneyTransferProtocol, ZHWorkersDelegate>
@property (nonatomic, copy) NSString     *name;
@property (nonatomic, assign)   BOOL     busy;

+ (instancetype)processorWithName:(NSString *)name;

- (void)processObject:(id)object;
- (void)performWorkWithObject:(id)object;

- (void)finishProcessing;
- (void)finishProcessingObject:(id)object;
- (void)processObjectInBackground:(id)object;


@end
