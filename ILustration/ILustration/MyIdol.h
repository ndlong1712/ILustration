//
//  MyIdol.h
//  ILustration
//
//  Created by NguyenDinh.Long on 7/28/16.
//  Copyright © 2016 NguyenDinh.Long. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Gender : NSUInteger {
    None = 0,
    Male = 1,
    Female = 2
}Gender;

typedef enum Smoker : NSUInteger {
    MuchSmoke = 6,
    NonSmoke = 9
} Smoker;

@interface MyIdol : NSObject

@property (nonatomic) int age;
@property (nonatomic) int covered;
@property (nonatomic) Gender gender;
@property (nonatomic) Smoker typeSmoker;

@end
