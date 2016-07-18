//
//  ZHAlphabet.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT
NSRange ZHCreateAlphabetRange(unichar value1, unichar value2);

@interface ZHAlphabet : NSObject <NSFastEnumeration>
+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabers;
+ (instancetype)alphabetWithCharacters:(NSString *)string;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithSymbols:(NSString *)string;

- (NSUInteger)count;

// take string at index
- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

// converts the alphabet in a row
- (NSString *)string;

@end
