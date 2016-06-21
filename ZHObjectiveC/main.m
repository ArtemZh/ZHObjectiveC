//
//  main.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 09.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHCreature.h"
#import "ZHCreatureTest.h"
#import "NSString+ZHExtantion.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ZHCreatureTest *test = [[ZHCreatureTest new] autorelease];
        
        [test ZHCreatureTest];
        
        NSString *stringTest = [[NSString randomLowercaseStringwithLength:10] autorelease ];
        NSLog(@" %@", stringTest);
        stringTest = [[NSString randomNumericStringwithLength:10] autorelease ];
    }
    return 0;
}
