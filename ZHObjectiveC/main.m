//
//  main.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 09.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHCreature.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        [ZHCreature sayHello];
        [[NSArray alloc] init];
        
        id pers = [[ZHCreature alloc] initWithName:@"pers"];
        [pers sayPersonalHello];
    }
    return 0;
}
