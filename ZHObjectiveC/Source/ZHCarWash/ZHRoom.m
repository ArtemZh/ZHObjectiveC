//
//  ZHRoom.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRoom.h"
#import "NSObject+ZHExtension.h"

@interface ZHRoom ()

@property (nonatomic, retain) NSMutableArray *mutableWorkers;

@end

@implementation ZHRoom


- (void)dealloc {
    self.mutableWorkers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableWorkers = [NSMutableArray object];
    
    return self;
}

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

- (void)addWorker:(id)worker {
    NSMutableArray *workers = self.mutableWorkers;
    if (![workers containsObject:worker]){
        [workers addObject:worker];
    }
}

- (void)removeWorker:(id)worker {
    [self.mutableWorkers removeObject:worker];
}

@end
