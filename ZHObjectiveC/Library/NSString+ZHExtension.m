//
//  NSString+ZHExtension.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 21.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "NSString+ZHExtension.h"

NSRange ZHCreateAlphabetRange(unichar value1, unichar value2) {
    NSUInteger headValue = MIN(value1, value2);
    NSUInteger railValue = MAX(value1, value2);
    
    return NSMakeRange(headValue, railValue - headValue + 1);
}


@implementation NSString (ZHExtension)

+ (instancetype)randomStringWithLength:(NSUInteger)length
                              alphabet:(NSString *)alphabet
{
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger index = 0; index < length; index ++) {
        [string appendFormat:@"%c", [alphabet characterAtIndex:arc4random_uniform((u_int32_t)length)]];
    }
    
    return [self stringWithString:string];
}

+ (instancetype)alphabetWithUnicodeFirstSymbol:(unichar)firstSymbol
                                    lastSymbol:(unichar)lastSymbol
{
    NSMutableString *result = [NSMutableString string];
    NSRange range = ZHCreateAlphabetRange(firstSymbol, lastSymbol);
    for (NSUInteger index = range.location; index <= NSMaxRange(range); index ++) {
        NSString *buffer = [[NSString alloc]initWithBytes:&index
                                                   length:1
                                                 encoding:NSUTF8StringEncoding];
        [result appendString:buffer];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self letterAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeFirstSymbol:'0' lastSymbol:'9'];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeFirstSymbol:'a' lastSymbol:'z'];
}

+ (instancetype)capitalizedLetterAlphabet {
    return [self alphabetWithUnicodeFirstSymbol:'A' lastSymbol:'Z'];
}

+ (instancetype)letterAlphabet {
    NSMutableString *result = [NSMutableString new];
    [result appendString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitalizedLetterAlphabet]];
    
    return [self stringWithString:result];
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.length];
    NSUInteger length = [self length];
    
    for (NSUInteger index = 0; index < length; index ++) {
        unichar resultChar = [self characterAtIndex:index];
        [result addObject:[NSString stringWithFormat:@"%c", resultChar]];
    }
    
    return [[result copy] autorelease];
}

@end
