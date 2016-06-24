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
#import "NSString+ZHExtension.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ZHCreatureTest *test = [[ZHCreatureTest new] autorelease];
        
        [test ZHCreatureTest];
        
        int lenght = kZHDefoultStringLenght;
        
        NSString *stringTest = [[NSString randomLowercaseStringwithLength:lenght] init ];
        NSLog(@" %@", stringTest);
        stringTest = [[NSString randomNumericStringwithLength:lenght] init ];
    }
    return 0;
}
