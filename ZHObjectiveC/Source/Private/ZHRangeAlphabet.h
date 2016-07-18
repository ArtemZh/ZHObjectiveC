//
//  ZHRangeAlphabet.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZHAlphabet.h"

@interface ZHRangeAlphabet : ZHAlphabet
@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;

@end
