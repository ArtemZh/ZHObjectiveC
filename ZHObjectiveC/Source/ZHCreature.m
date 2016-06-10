//
//  ZHCreature.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 10.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//


#import "ZHCreature.h"

@interface ZHCreature ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation ZHCreature

@dynamic children;

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)initWithName:(NSString*) name {
    self = [super init];
    
    self.name = name;
    self.mutableChildren = [NSMutableArray object];
    
    return self;
}




@end
