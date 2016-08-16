//
//  ZHWorkersDispatcher.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 16.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHWorkersDispatcher : NSObject
@property (nonatomic, readonly) NSArray     *processors;

+ (instancetype)dispatcherWithProcessors:(NSArray *)processors;

- (void)addProcessor:(id)processor;
- (void)removeProcessor:(id)processor;

- (void)addProcessors:(NSArray *)processors;
- (void)removeProcessors:(NSArray *)processors;

- (void)processObject:(id)object;

@end
