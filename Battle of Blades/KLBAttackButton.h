//
//  KLBAttackButton.h
//  Battle of Blades
//
//  Created by Chase Gosingtian on 8/29/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLBAttackDelegate.h"
#import "KLBAttack.h"

extern CGFloat const KLB_ATTACK_BUTTON_WIDTH;
extern CGFloat const KLB_ATTACK_BUTTON_HEIGHT;

@interface KLBAttackButton : UIButton
@property (retain, nonatomic) IBOutlet UIButton *attackButton;
@property (unsafe_unretained, nonatomic) id<KLBAttackDelegate> delegate;
@property (retain, nonatomic) KLBAttack *attack;
@property (retain, nonatomic) NSTimer *moveTimer;
@property (retain, nonatomic) NSTimer *waitTimer;

@property (nonatomic) BOOL isShield;

@property (nonatomic) BOOL canMove;
@property (nonatomic) CGPoint moveDestination;
@property (nonatomic) BOOL isWaiting;

- (IBAction)buttonTapped:(id)sender;
- (void)convertToShield;
- (void)allowMovement;

@end
