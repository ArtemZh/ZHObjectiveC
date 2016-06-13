//
//  NSObject+ZHExtension.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "NSObject+ZHExtension.h"

@implementation NSObject (ZHExtension)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
