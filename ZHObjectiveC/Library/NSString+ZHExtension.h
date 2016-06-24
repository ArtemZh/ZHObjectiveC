//
//  NSString+ZHExtension.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 21.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int      kZHDefoultStringLenght = 10;
@interface NSString (ZHExtension)

+ (instancetype)randomLowercaseStringwithLength:(NSUInteger)length;

+ (instancetype)randomStringwithLength:(NSUInteger)length;

+ (instancetype)randomNumericStringwithLength:(NSUInteger)length;

@end