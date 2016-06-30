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
#import "ZHCarWashingProcess.h"
#import "ZHQueue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        ZHCreatureTest *test = [[ZHCreatureTest new] autorelease];
//        
//        [test ZHCreatureTest];
//        
//        int lenght = kZHDefaultStringLength;
//        
//        NSString *stringTest = [[NSString randomLowercaseStringwithLength:lenght] init ];
//        NSLog(@" %@", stringTest);
//        stringTest = [[NSString randomNumericStringwithLength:lenght] init ];
        
        ZHCarWashingProcess *complex = [ZHCarWashingProcess object];
        ZHCar *car = [ZHCar object];
        
        [complex washCar:car];
        
        
        ZHQueue *testQueue = [ZHQueue object];
        [testQueue enqueue:car];
        [testQueue dequeue];
        
        
        
    }
    return 0;
}
