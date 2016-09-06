//
//  ZHGCD.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 01.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZHBlock)();

typedef enum {
    ZHDispatchQueuePriorityHigh         = DISPATCH_QUEUE_PRIORITY_HIGH,
    ZHDispatchQueuePriorityDefaul       = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    ZHDispatchQueuePriorityLow          = DISPATCH_QUEUE_PRIORITY_LOW,
    ZHDispatchQueuePriorityBackground   = DISPATCH_QUEUE_PRIORITY_BACKGROUND,
    ZHDispatchQueuePriorityMain
} ZHDispatchQueuePriorityType;

typedef enum {
    ZHBlockExecutionSynchronous,
    ZHBlockExecutionAsynchronous
} ZHBlockExecutionType;


void ZHPerformAsyncBlockOnMainQueue(ZHBlock block);
void ZHPerformSyncBlockOnMainQueue(ZHBlock block);

void ZHPerformAsyncBlockOnBackgroundQueue(ZHBlock block);
void ZHPerformSyncBlockOnBackgroundQueue(ZHBlock block);

void ZHPerformAsyncBlockOnLowQueue(ZHBlock block);
void ZHPerformSyncBlockOnLowQueue(ZHBlock block);

void ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityType type, ZHBlock block);
void ZHDispatchSyncBlockOnQueueWithType(ZHDispatchQueuePriorityType type, ZHBlock block);

dispatch_queue_t ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityType type);
