//
//  ZHCreature.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 10.06.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    ZHCreatureGenderUndefined,
    ZHCreatureGenderMale,
    ZHCreatureGenderFemale
} ZHCreatureGender;


@interface ZHCreature : NSObject
@property (nonatomic, copy)     NSString                *name;
@property (nonatomic, assign)   NSUInteger              age;
@property (nonatomic, assign)   float                   weight;
@property (nonatomic, assign)   ZHCreatureGender        gender;
@property (nonatomic, readonly) NSArray                 *children;

- (instancetype)initWithName:(NSString*) name;



@end