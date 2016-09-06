//
//  ZHComplexDispatcher.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 26.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZHComplexDispatcher : NSObject
@property (nonatomic, readonly, getter=isWorking) BOOL working;

+ (instancetype)disptcherWithComplex:(id)carWashComplex;

- (void)washCars;

-(void)setWorking:(BOOL)working;

@end