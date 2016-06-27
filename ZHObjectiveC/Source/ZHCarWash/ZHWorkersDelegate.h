//
//  ZHWorkersDelegate.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 27.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZHWorkersDelegate <NSObject>

- (void)workerDidFinishProcessingObject:(id)worker;

@end
