//
//  NSString+ZHExtension.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 21.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZHExtension)

+ (instancetype)randomStringWithLength:(NSUInteger)length
                              alphabet:(NSString *)alphabet;

+ (instancetype)alphabetWithUnicodeFirstSymbol:(unichar)firstSymbol
                                    lastSymbol:(unichar)lastSymbol;

+ (instancetype)alphanumericAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalizedLetterAlphabet;
+ (instancetype)letterAlphabet;

- (NSArray *)symbols;

@end
