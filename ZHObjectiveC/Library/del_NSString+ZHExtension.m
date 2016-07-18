//
//  NSString+ZHExtension.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 21.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "NSString+ZHExtension.h"

@implementation NSString (ZHExtension)

//in methods need to remove duplicate code written below

+ (instancetype)randomLowercaseStringwithLength:(NSUInteger)length {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++){
        NSString *symbols = [NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a'];
        [string appendString:symbols];
    }
    
    NSLog(@"%@", string);
    
    return [self stringWithString:string];
}

+ (instancetype)randomStringwithLength:(NSUInteger)length {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++){
        NSString *symbols = [NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'A'];
        [string appendString:symbols];
    }
    
    NSLog(@"%@", string);
    
    return [self stringWithString:string];
}

+ (instancetype)randomNumericStringwithLength:(NSUInteger)length {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++){
        NSString *symbols = [NSString stringWithFormat:@"%c", arc4random_uniform(19) + '!'];
        [string appendString:symbols];
    }
    
    NSLog(@"\n%@", string);
    
    return [self stringWithString:string];
}

@end