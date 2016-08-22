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

static const NSUInteger kZHCarsCount = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        ZHCarWashingProcess *complex = [ZHCarWashingProcess object];
        
        for (NSUInteger count = 1; count < kZHCarsCount+1; count++) {
            [complex washCar:[ZHCar object]];
            NSLog(@"add car to queue %lu", count);
        }
        
        [[NSRunLoop mainRunLoop] run];
        
        
        
        
    }
    
    return 0;
}
