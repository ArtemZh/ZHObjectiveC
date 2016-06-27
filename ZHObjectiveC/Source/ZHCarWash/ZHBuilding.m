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
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation ZHBuilding

@dynamic rooms;

#pragma mark -
#pragma mark initialize / deallocate

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableRooms = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public methods

- (void)addRoom:(ZHRoom *)room {
    NSMutableArray *rooms = self.mutableRooms;
    if(![rooms containsObject:room]) {
        [rooms addObject:room];
    }
}

- (void)removeRoom:(ZHRoom *)room {
    [self.mutableRooms removeObject:room];
}

- (NSArray *)roomsWithClass:(Class)class {
    NSMutableArray *rooms = [NSMutableArray object];
    for (ZHRoom *room in self.rooms) {
        if ([rooms isMemberOfClass:class])
            [rooms addObject:room];
    }
    
    return rooms;
}

- (NSArray *)workersWithClass:(Class)class {
    NSMutableArray *workers = [NSMutableArray object];
    for (ZHRoom *room in self.rooms) {
        [workers addObjectsFromArray:[room workersWithClass:class]];
    }
    
    return [[workers copy] autorelease];
}


@end
