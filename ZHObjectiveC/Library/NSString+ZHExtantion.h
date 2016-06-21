//
//  NSString+ZHExtantion.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 21.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZHExtension)

+ (instancetype)randomLowercaseStringwithLength:(NSUInteger)length;

+ (instancetype)randomStringwithLength:(NSUInteger)length;

+ (instancetype)randomNumericStringwithLength:(NSUInteger)length;

@end