//
//  ZHObservableObject.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHObservableObject.h"

#import "NSObject+ZHExtension.h"

@interface ZHObservableObject ()
@property (nonatomic, retain) NSHashTable     *observersTable;

- (void)notifyOfStateChangeWithSelector:(SEL)selector;
- (void)notifyOfStateChangeWithSelector:(SEL)selector object:(id)object;

@end

@implementation ZHObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initialisations / Deallocations

- (void)dealloc {
    self.observersTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    return self.observersTable.setRepresentation;
}

#pragma mark -
#pragma mark Public implementations

- (void)addObserver:(id)observer {
    if (observer) {
        [self.observersTable addObject:observer];
    }
}

- (void)removeObserver:(NSObject *)observer {
    [self.observersTable removeObject:observer];
}

- (BOOL)containsObserver:(id)object {
    return [self.observersTable containsObject:object];
}

- (void)addObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self addObserver:observer];
    }
}

- (void)removeObservers {
    [self.observersTable removeAllObjects];
}

- (void)setState:(NSUInteger)state {
    if (state != _state) {
        _state = state;
        
        [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (_state != state) {
        _state = state;
        [self notifyWithObject:object ofState:state];
    }
    
    [object setState:state];
}

- (void)notifyWithObject:(id)object ofState:(NSUInteger)state {
    [self notifyOfStateChangeWithSelector:[object selectorForState:state] object:object];
}

#pragma mark -
#pragma mark Private implementations

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    [self notifyOfStateChangeWithSelector:selector object:nil];
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector object:(id)object {
    NSHashTable *observers = self.observersTable;
    
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}


@end
