//
//  ZHRoom.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHBoss.h"
#import "ZHAccountant.h"

#import <Foundation/Foundation.h>

@interface ZHRoom : NSObject

@property (nonatomic, readonly) NSArray *workers ;

- (void)addWorker:(id)worker;
- (void)removeWorker:(id)worker;

@end
