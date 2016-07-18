//
//  ZHClusterAlphabet.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZHAlphabet.h"

@interface ZHClasterAlphabet : ZHAlphabet
@property (nonatomic, readonly) NSArray *alphabets;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
