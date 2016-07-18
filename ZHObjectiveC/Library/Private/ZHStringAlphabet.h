//
//  ZHStringAlphabet.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZHAlphabet.h"

@interface ZHStringAlphabet : ZHAlphabet
@property (nonatomic, readonly) NSArray *strings;

- (instancetype)initWithArray:(NSArray *)strings;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;

@end
