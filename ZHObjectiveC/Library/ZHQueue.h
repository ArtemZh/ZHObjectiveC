//
//  ZHQueue.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 27.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHQueue : NSObject
@property (nonatomic, readonly) NSUInteger objectsCount;

- (void)enqueue:(id)object;
- (id)dequeue;

@end
