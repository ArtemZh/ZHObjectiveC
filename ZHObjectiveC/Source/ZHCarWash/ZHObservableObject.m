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

@end

@implementation ZHObservableObject

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
#pragma mark Public implementations

- (void)addObserver:(id)observer {
    if (observer) {
        [self.observersTable addObject:observer];
    }
}

- (void)removeObserver:(NSObject *)observer {
    [self.observersTable removeObject:observer];
}


@end
