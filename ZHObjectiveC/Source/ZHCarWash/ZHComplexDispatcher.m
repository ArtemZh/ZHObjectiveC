//
//  ZHComplexDispatcher.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 26.08.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHComplexDispatcher.h"

#import "ZHCar.h"
#import "ZHCarWashingProcess.h"

#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"

static const NSUInteger kZHCarsCount = 10;
static const uint8_t kZHInterval = 4;

@interface ZHComplexDispatcher ()
@property (nonatomic, retain) ZHCarWashingProcess       *complex;
@property (nonatomic, assign) NSTimer                   *timer;
@property (nonatomic, assign) BOOL                      sendingCars;

- (instancetype)initWithComplex:(ZHCarWashingProcess *)complex;

- (void)starTimer;
- (void)stopTimer;

@end

@implementation ZHComplexDispatcher

@dynamic sendingCars;

#pragma mark -
#pragma mark Class methods

+ (instancetype)disptcherWithComplex:(ZHCarWashingProcess *)complex {
    return [[[self alloc] initWithComplex:complex] autorelease];
}

#pragma mark -
#pragma mark Initializations / Deallocations

- (void)dealloc {
    self.complex = nil;
    
    [super dealloc];
}

- (instancetype)initWithComplex:(ZHCarWashingProcess *)complex {
    self = [super init];
    self.complex = complex;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [self.timer invalidate];
        
        _timer = timer;
    }
}

- (void)setworking:(BOOL)sendingCars {
    SEL selector = sendingCars ? @selector(starTimer) : @selector(stopTimer);
    [self performSelectorOnMainThread:selector withObject:nil waitUntilDone:NO];
}

- (BOOL)isWorking {
    return nil != self.timer;
}

#pragma mark -
#pragma mark Public implementations

- (void)washCars {
    ZHCarWashingProcess *complex = self.complex;
    for (NSUInteger count = 0; count < kZHCarsCount; count++) {
        [complex performSelectorInBackground:@selector(washCar:) withObject:[ZHCar object]];
    }
    
    NSLog(@"%lu cars added to washing", (unsigned long)kZHCarsCount);
}

- (void)stopTimer {
    self.timer = nil;
}

- (void)starTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kZHInterval
                                                  target:self
                                                selector:@selector(washCars)
                                                userInfo:nil
                                                 repeats:YES];
}


//- (void)startTimer {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kZHInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self washCars];
//        [self startTimer];
//    });
//}


@end
