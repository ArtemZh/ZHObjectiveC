//
//  ZHGCD.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 01.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHGCD.h"

#pragma mark -
#pragma mark Privat declarations

void ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionType type, ZHBlock block);

void ZHPefromBlockWithQueueAndType(ZHBlockExecutionType type, dispatch_queue_t queue, ZHBlock block);

#pragma mark -
#pragma mark Public implementations

void ZHPerformAsyncBlockOnMainQueue(ZHBlock block) {
    ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionAsynchronous, block);
}

void ZHPerformSyncBlockOnMainQueue(ZHBlock block) {
    ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionSynchronous, block);
}

void ZHPerformAsyncBlockOnBackgroundQueue(ZHBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionAsynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityBackground),
                                   block);
}

void ZHPerformSyncBlockOnBackgroundQueue(ZHBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionSynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityBackground),
                                   block);
}

void ZHPerformAsyncBlockOnLowQueue(ZHBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionAsynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityLow),
                                   block);
}

void ZHPerformSyncBlockOnLowQueue(ZHBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionSynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityLow),
                                   block);
}

dispatch_queue_t ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityType type) {
    return dispatch_get_global_queue(type, 0);
}

#pragma mark -
#pragma mark Privat implementations

void ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionType type, ZHBlock block) {
    ZHPefromBlockWithQueueAndType(type, dispatch_get_main_queue(), block);
}

void ZHPefromBlockWithQueueAndType(ZHBlockExecutionType type, dispatch_queue_t queue, ZHBlock block) {
    if (!block) {
        return;
    }
    
    switch (type) {
        case ZHBlockExecutionSynchronous:
            dispatch_sync(queue, block);
            break;
            
        case ZHBlockExecutionAsynchronous:
            dispatch_async(queue, block);
            break;
            
        default:
            break;
    }
}
