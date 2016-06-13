//
//  ZHCreature.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 10.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//


#import "ZHCreature.h"

static NSString * const kZHHellow = @"Hellow";

@interface ZHCreature ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;
@property (nonatomic) NSString *secondName;

@end

@implementation ZHCreature

@synthesize secondName = _secondName;

- (NSString *)secondName{
    return _secondName;
}

- (void)setSName:(NSString *)secondName {
    _secondName = secondName;
}

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


+ (void)sayHello {
    NSLog(@"hello");
}

- (void)sayPersonalHello {
    NSLog(@"PiHello");
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public implementation

- (void)addChild:(ZHCreature *)creature {
    NSMutableArray *children = self.mutableChildren;
    
    if(![children containsObject:creature]) {
        [children addObject:creature];
    }
}

- (void)removeChild:(ZHCreature *)creature {
    NSMutableArray *children = self.mutableChildren;
    
    if ([children containsObject:creature]) {
        [children removeObject:creature];
    }
}

- (void)saySomething {
    NSLog(@"%@", kZHHellow);
}

- (void)familySayHi {
    [self saySomething];
    for (ZHCreature *creatureChildren in self.mutableChildren) {
        [creatureChildren saySomething];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Name - %@, age - %lu, Children - %@",
            self.name,
            (unsigned long)self.age,
            self.children];
}

- (void)performGenderSpecificOperation {
    NSLog(@"SpecificOperation");
}




@end