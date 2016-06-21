//
//  ZHCreature.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 10.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCreature.h"

static NSString * const kZHHello = @"Hello";

@interface ZHCreature ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;
@property (nonatomic) NSString *secondName;

@end

@implementation ZHCreature

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (void)sayHello {
    NSLog(@"hello");
}


#pragma mark -
#pragma mark Initializtions and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableChildren = [NSMutableArray object];
        
    return self;
}

- (instancetype)initWithName:(NSString*) name {
    self = [self init];
    
    self.name = name;
    self.mutableChildren = [NSMutableArray object];
    
    return self;
}


#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public implementation

- (void)sayPersonalHello {
    NSLog(@"PiHello");
}

- (void)addChild:(ZHCreature *)creature {
    if (creature) {
        [self.mutableChildren addObject:creature];
    }
}

- (void)removeChild:(ZHCreature *)creature {
    [self.mutableChildren removeObject:creature];
}

- (void)saySomething {
    NSLog(@"%@ %@", kZHHello, self.name);
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

//@synthesize secondName = _secondName;
//
//- (NSString *)secondName{
//    return _secondName;
//}
//
//- (void)setSecondName:(NSString *)secondName {
//    _secondName = secondName;
//}

@end
