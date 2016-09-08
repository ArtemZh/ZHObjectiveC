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

#import "ZHGCD.h"
#import "NSObject+ZHExtension.h"
#import "NSArray+ZHExtension.h"
#import "ZHTimerSupport.h"

static const NSUInteger kZHCarsCount = 10;
static const uint8_t kZHInterval = 4;



@interface ZHComplexDispatcher ()
@property (nonatomic, retain) ZHCarWashingProcess       *carWashComplex;
@property (nonatomic, assign) NSTimer                   *timer;

- (instancetype)initWithComplex:(ZHCarWashingProcess *)carWashComplex;

- (void)startTimer;
- (void)stopTimer;

@end

@implementation ZHComplexDispatcher

@dynamic working;

#pragma mark -
#pragma mark Class methods

+ (instancetype)disptcherWithComplex:(ZHCarWashingProcess *)carWashComplex {
    return [[[self alloc] initWithComplex:carWashComplex] autorelease];
}

#pragma mark -
#pragma mark Initializations / Deallocations

- (void)dealloc {
    self.carWashComplex = nil;
    
    [super dealloc];
}

- (instancetype)initWithComplex:(ZHCarWashingProcess *)carWashComplex {
    self = [super init];
    self.carWashComplex = carWashComplex;
    
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



-(void)setWorking:(BOOL)working {
    if (working) {
        if (!self.working) {
            [self startTimer];
        }
    } else {
        [self stopTimer];
    }
    
}

- (BOOL)isWorking {
    return nil != self.timer;
}

#pragma mark -
#pragma mark Public implementations

- (void)washCars {
    ZHCarWashingProcess *carWashComplex = self.carWashComplex;
    for (NSUInteger count = 0; count < kZHCarsCount; count++) {
        [carWashComplex performSelectorInBackground:@selector(washCar:) withObject:[ZHCar object]];
    }
    
    NSLog(@"%lu cars added to washing", (unsigned long)kZHCarsCount);
}

- (void)stopTimer {
    self.timer = nil;
}


- (void)startTimer {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kZHInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self washCars];
        [self startTimer];
    });
}


@end
