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

void ZHPerformBlockOnMainQueueWithBlock (ZHBlock block);

void ZHPefromBlockWithQueueAndType(ZHBlockExecutionType type, dispatch_queue_t queue, ZHBlock block);

#pragma mark -
#pragma mark Public implementations

void ZHPerformAsyncBlockOnMainQueue(ZHBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityMain, block);
    }
}

void ZHPerformSyncBlockOnMainQueue(ZHBlock block) {
    ZHDispatchSyncBlockOnQueueWithType(ZHDispatchQueuePriorityMain, block);
}

void ZHPerformAsyncBlockOnBackgroundQueue(ZHBlock block) {
    ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityBackground, block);
}

void ZHPerformSyncBlockOnBackgroundQueue(ZHBlock block) {
    ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityBackground, block);
}

void ZHPerformAsyncBlockOnLowQueue(ZHBlock block) {
    ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityLow, block);
}

void ZHPerformSyncBlockOnLowQueue(ZHBlock block) {
    ZHDispatchSyncBlockOnQueueWithType(ZHDispatchQueuePriorityLow, block);
}

dispatch_queue_t ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityType type) {
    if (type == ZHDispatchQueuePriorityMain) {
        return dispatch_get_main_queue();
    }
    
    return dispatch_get_global_queue(type, 0);
}

void ZHDispatchAsyncBlockOnQueueWithType(ZHDispatchQueuePriorityType type, ZHBlock block) {
    dispatch_async(ZHDisptchQueueWithPriorityType(type), block);
}

void ZHDispatchSyncBlockOnQueueWithType(ZHDispatchQueuePriorityType type, ZHBlock block) {
    dispatch_sync(ZHDisptchQueueWithPriorityType(type), block);
}
