//
//  ZHObservableObject.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(NSObject *)observer;
- (BOOL)containsObserver:(id)object;
- (void)addObservers:(NSArray *)observers;
- (void)removeObservers;

- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyWithObject:(id)object ofState:(NSUInteger)state;
- (void)setState:(NSUInteger)state withObject:(id)object;

@end