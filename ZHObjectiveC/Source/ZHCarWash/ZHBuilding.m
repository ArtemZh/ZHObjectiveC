//
//  ZHBuilding.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBuilding.h"
#import "NSObject+ZHExtension.h"

@interface ZHBuilding()
@property (nonatomic, retain) NSMutableArray *mutablerooms;

@end

@implementation ZHBuilding

@dynamic rooms;

#pragma mark -
#pragma mark initialize / deallocate

- (void)dealloc {
    self.mutablerooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutablerooms = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)rooms {
    return [[self.mutablerooms copy] autorelease];
}

#pragma mark -
#pragma mark Public methods

- (void)addRoom:(ZHRoom *)room {
    NSMutableArray *rooms = self.mutablerooms;
    if(![rooms containsObject:room]) {
        [rooms addObject:room];
    }
}

- (void)removeRoom:(ZHRoom *)room {
    [self.mutablerooms removeObject:room];
}




@end
