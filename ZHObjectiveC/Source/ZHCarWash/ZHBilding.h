//
//  ZHBilding.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHRoom.h"

#import <Foundation/Foundation.h>

@interface ZHBilding : NSObject


@property (nonatomic, readonly) NSArray *rooms;

- (void)addRoom:(ZHRoom *)room;
- (void)removeRoom:(ZHRoom *)room;


@end
