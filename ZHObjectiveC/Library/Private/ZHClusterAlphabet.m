//
//  ZHClusterAlphabet.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHClusterAlphabet.h"

@interface ZHClasterAlphabet ()

@property (nonatomic, retain) NSArray *alphabets;
@property (nonatomic, assign) NSUInteger symbolsCount;

- (NSUInteger)symbolsCount:(NSArray *)alphabets;

@end
@implementation ZHClasterAlphabet

#pragma mark -
#pragma mark Initialization and deallocation

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.symbolsCount = [self symbolsCount:alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    if (index < self.symbolsCount) {
        NSUInteger iteratedIndex = index;
        for (ZHAlphabet *alphabet in self.alphabets) {
            if (iteratedIndex < [alphabet count]) {
                return alphabet[iteratedIndex];
            }
            
            iteratedIndex -= [alphabet count];
        }
    }
    
    
    return nil;
}


#pragma mark -
#pragma mark Private

- (NSUInteger)symbolsCount:(NSArray *)alphabets {
    NSUInteger count = 0;
    for (ZHAlphabet *alphabet in self.alphabets) {
        count += [alphabet count];
    }
    
    return count;
}

@end
