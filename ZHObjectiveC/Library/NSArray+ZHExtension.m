//
//  NSArray+ZHExtension.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 27.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "NSArray+ZHExtension.h"
#import "NSObject+ZHExtension.h"

@implementation NSArray (ZHExtensions)

+ (instancetype)arrayWithObjectsCount:(NSUInteger)count block:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray object];
    
    for (NSUInteger index = 0; index < count; index++) {
        [array addObject:block()];
    }
    
    return [self arrayWithArray:array];
}


- (NSArray *)filteredArrayUsingBlock:(ZHArrayFiltredUsingBlock)block {
    if (!block) {
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

@end