//
//  ZHAlphabet.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHAlphabet.h"

#import "ZHRangeAlphabet.h"
#import "ZHClusterAlphabet.h"
#import "ZHStringAlphabet.h"

#import "NSString+ZHExtension.h"

NSRange ZHCreateAlphabetRange(unichar value1, unichar value2) {
    NSUInteger headValue = MIN(value1, value2);
    NSUInteger railValue = MAX(value1, value2);
    
    return NSMakeRange(headValue, railValue - headValue + 1);
}

@implementation ZHAlphabet

#pragma mark -
#pragma mark Class methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[ZHRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[ZHStringAlphabet alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithCharacters:(NSString *)string {
    return [[[ZHStringAlphabet alloc] initWithStrings:[string symbols]] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabers {
    return [[[ZHClasterAlphabet alloc] initWithAlphabets:alphabers] autorelease];
}
#pragma mark -
#pragma mark Initialization and deallocation

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[ZHRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[ZHClasterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[ZHStringAlphabet alloc] initWithStrings:strings];
}

- (instancetype)initWithSymbols:(NSString *)string {
    [self release];
    
    return [self initWithStrings:[string symbols]];;
}

#pragma mark -
#pragma mark Public methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbols in self) {
        [string appendString:symbols];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)len
{
    state->mutationsPtr = (unsigned long *)self;
    NSUInteger length = MIN(state->state + len, [self count]);
    len = length - state->state;
    
    if (0 != len) {
        for (NSUInteger index = 0; index < len; index ++) {
            buffer[index] = self[index + state->state];
        }
    }
    
    state->itemsPtr = buffer;
    
    state->state +=  len;
    
    return len;
}

@end
