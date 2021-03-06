//
//  KLBEnemy.h
//  Battle of Blades
//
//  Created by Chase Gosingtian on 8/28/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const KLB_DEFAULT_ENEMY_KEY;
extern NSString *const KLB_DEFAULT_ENEMY_NAME;
extern CGFloat const KLB_DEFAULT_ENEMY_LEVEL;
extern NSUInteger const KLB_DEFAULT_ENEMY_HEALTH;
extern NSUInteger const KLB_DEFAULT_ENEMY_TIME_LIMIT_SECONDS;

@interface KLBEnemy : NSObject

@property (retain, nonatomic) NSString *key; // primary key;
@property (retain, nonatomic) NSString *enemyName;
@property (nonatomic) NSUInteger level;
@property (nonatomic) NSUInteger healthMaximum;
@property (nonatomic) NSInteger healthRemaining; // can be negative
@property (nonatomic) NSInteger timeLimitSeconds; // can be negative

- (instancetype)initWithKey:(NSString *)key
                       name:(NSString *)enemyName
                      level:(NSUInteger)level
              healthMaximum:(NSUInteger)healthMaximum
           timeLimitSeconds:(NSUInteger)timeLimitSeconds;

- (NSString *)description;

@end
