//
//  ZHComplexDispatcher.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 26.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHComplexDispatcher : NSObject
@property (nonatomic, readonly) BOOL sendingCars;

+ (instancetype)disptcherWithComplex:(id)complex;

- (void)setworking:(BOOL) working;

- (void)washCars;

@end