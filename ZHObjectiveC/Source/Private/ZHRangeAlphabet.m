//
//  ZHRangeAlphabet.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRangeAlphabet.h"

@interface ZHRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@implementation ZHRangeAlphabet

#pragma mark -
#pragma mark Initialization and deallocation

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
    
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
