//
//  NSArray+ZHExtension.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 27.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ZHArrayFiltredUsingBlock)(id object);

@interface NSArray (ZHExtensions)

- (NSArray *)filteredArrayUsingBlock:(ZHArrayFiltredUsingBlock)block;

@end