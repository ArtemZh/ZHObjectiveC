//
//  ZHStringAlphabet.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHStringAlphabet.h"

@interface ZHStringAlphabet ()
@property (nonatomic, assign) NSArray *strings;

@end

@implementation ZHStringAlphabet

#pragma mark -
#pragma mark Initialization and deallocation

- (void)dealloc {
    self.strings = nil;
    
    [super dealloc];
}

- (instancetype)initWithArray:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings = strings;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.strings.count;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)len
{
    return [self.strings countByEnumeratingWithState:state
                                             objects:buffer
                                               count:len];
}

@end
