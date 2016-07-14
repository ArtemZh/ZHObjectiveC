//
//  ZHWorker.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 12.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHWorker.h"
#import "ZHRandom.h"

@interface ZHWorker ()
@property (nonatomic, assign) float money;

@end

@implementation ZHWorker

#pragma mark -
#pragma mark initialize / deallocate

- (void)dealloc {
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.yearsOfExperience = ZHRandomIntegerWithinGivenLimits(1, 5);
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)receiveMoney:(float)number {
    self.money += number;
}

- (void)giveMoney:(float)number {
    self.money -= number;
}

- (void)takeMoneyFromObject:(id<ZHMoneyTransferProtocol>)owner {
    self.busy = YES;
    float money = owner.money;
    [owner giveMoney:money];
    [self receiveMoney:money];
    self.busy = NO;
}

- (void)processObject:(id)object {
    self.busy = YES;
    [self performWorkWithObject:object];
    
    id delegate = self.delegate;
    if ([delegate respondsToSelector:@selector(workerDidFinishProcessingObject:)]) {
        [self.delegate workerDidFinishProcessingObject:self];
    }
    
    self.busy = NO;
}

- (void)performWorkWithObject:(id)object {
    ///
}

@end