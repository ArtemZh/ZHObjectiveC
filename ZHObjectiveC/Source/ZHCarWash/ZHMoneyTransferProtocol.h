//
//  ZHMoneyTransferProtocol.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZHMoneyTransferProtocol <NSObject>
@property (nonatomic, readonly) float money;

- (void)giveMoney:(float)number;
- (void)receiveMoney:(float)number;

@optional

- (void)takeMoneyFromObject:(id<ZHMoneyTransferProtocol>)owner;

@end
