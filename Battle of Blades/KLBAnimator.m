//
//  KLBAnimator.m
//  Battle of Blades
//
//  Created by Chase Gosingtian on 8/29/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import "KLBAnimator.h"

// CA Strings
NSString *const KLB_CA_OPACITY_STRING = @"opacity";
NSString *const KLB_CA_POSITION_STRING = @"position";

CGFloat const KLB_ANIMATION_ZERO_F = 0.0;

// fadeOutCALayer
CGFloat const KLB_FADE_OUT_DURATION = 0.5;
CGFloat const KLB_FADE_OUT_OPACITY_START = 1.0;
CGFloat const KLB_FADE_OUT_OPACITY_END = 0.0;

// fadeInCALayer
CGFloat const KLB_FADE_IN_DURATION = 0.5;
CGFloat const KLB_FADE_IN_OPACITY_START = 0.0;
CGFloat const KLB_FADE_IN_OPACITY_END = 1.0;

// moveCALayer
CGFloat const KLB_MOVE_ANIMATION_DURATION = 1.5;

// flashWhiteCALayer
CGFloat const KLB_FLASH_WHITE_DURATION = 0.1;
CGFloat const KLB_FLASH_WHITE_OPACITY = 0.5;

// flashAlphaCALayer
CGFloat const KLB_FLASH_ALPHA_FADE_IN_DURATION = 0.5;
CGFloat const KLB_FLASH_ALPHA_FADE_OUT_DURATION = 0.5;
CGFloat const KLB_FLASH_ALPHA_FADE_IN_OPACITY_START = 0.0;
CGFloat const KLB_FLASH_ALPHA_FADE_IN_OPACITY_END = 1.0;
CGFloat const KLB_FLASH_ALPHA_FADE_OUT_OPACITY_START = 1.0;
CGFloat const KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END = 0.0;

@implementation KLBAnimator
+ (void)fadeOutCALayer:(CALayer *)layer applyChanges:(BOOL)applyChanges {
    [CATransaction begin];
    
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    
    CAKeyframeAnimation *transparency = [[CAKeyframeAnimation alloc] init];
    
    transparency.fillMode = kCAFillModeForwards;
    
    [transparency setKeyPath:keyPathTransparency];
    transparency.duration = KLB_FADE_OUT_DURATION;
    
    NSMutableArray *transparencyValues = [[NSMutableArray alloc] init];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_OUT_OPACITY_START]];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_OUT_OPACITY_END]];
    transparency.values = transparencyValues;
    
    if (applyChanges) {
        [layer setOpacity:KLB_FADE_OUT_OPACITY_END];
    }
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [transparencyValues release];
         [transparency release];
         
         if (applyChanges) {
             [layer setOpacity:KLB_FADE_OUT_OPACITY_END];
         }
     }];
    
    [layer addAnimation:transparency forKey:keyPathTransparency];
    
    [CATransaction commit];
}

+ (void)fadeInCALayer:(CALayer *)layer applyChanges:(BOOL)applyChanges {
    [CATransaction begin];
    
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    
    CAKeyframeAnimation *transparency = [[CAKeyframeAnimation alloc] init];
    
    transparency.fillMode = kCAFillModeForwards;
    
    [transparency setKeyPath:keyPathTransparency];
    transparency.duration = KLB_FADE_IN_DURATION;
    
    NSMutableArray *transparencyValues = [[NSMutableArray alloc] init];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_IN_OPACITY_START]];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_IN_OPACITY_END]];
    transparency.values = transparencyValues;
    
    if (applyChanges) {
        [layer setOpacity:KLB_FADE_IN_OPACITY_END];
    }
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [transparencyValues release];
         [transparency release];
         
         if (applyChanges) {
             [layer setOpacity:KLB_FADE_IN_OPACITY_END];
         }
     }];
    
    [layer addAnimation:transparency forKey:keyPathTransparency];
    
    [CATransaction commit];
}

+ (void)fadeInCALayer:(CALayer *)layer duration:(CGFloat)duration applyChanges:(BOOL)applyChanges {
    [CATransaction begin];
    
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    
    CAKeyframeAnimation *transparency = [[CAKeyframeAnimation alloc] init];
    
    transparency.fillMode = kCAFillModeForwards;
    
    [transparency setKeyPath:keyPathTransparency];
    transparency.duration = duration;
    
    NSMutableArray *transparencyValues = [[NSMutableArray alloc] init];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_IN_OPACITY_START]];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_IN_OPACITY_END]];
    transparency.values = transparencyValues;
    
    if (applyChanges) {
        [layer setOpacity:KLB_FADE_IN_OPACITY_END];
    }
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [transparencyValues release];
         [transparency release];
         
         if (applyChanges) {
             [layer setOpacity:KLB_FADE_IN_OPACITY_END];
         }
     }];
    
    [layer addAnimation:transparency forKey:keyPathTransparency];
    
    [CATransaction commit];
}

+ (void)moveCALayer:(CALayer *)layer startPoint:(CGPoint)start endPoint:(CGPoint)end applyChanges:(BOOL)applyChanges {
    [CATransaction begin];
    
    NSString *keyPathPosition = KLB_CA_POSITION_STRING;
    
    CAKeyframeAnimation *positionAnimation = [[CAKeyframeAnimation alloc] init];
    
    positionAnimation.fillMode = kCAFillModeForwards;
    
    [positionAnimation setKeyPath:keyPathPosition];
    positionAnimation.duration = KLB_MOVE_ANIMATION_DURATION;
    
    NSMutableArray *positionValues = [[NSMutableArray alloc] init];
    [positionValues addObject:[NSValue valueWithCGPoint:start]];
    [positionValues addObject:[NSValue valueWithCGPoint:end]];
    positionAnimation.values = positionValues;
    
    if (applyChanges) {
        [layer setPosition:end];
    }
    
    [CATransaction setCompletionBlock:^()
     {
         [positionValues release];
         [positionAnimation release];
         
         if (applyChanges) {
             [layer setPosition:end];
         }
     }];
    
    [layer addAnimation:positionAnimation forKey:keyPathPosition];
    
    [CATransaction commit];
}

+ (void)flashWhiteCALayer:(CALayer *)layer applyChanges:(BOOL)applyChanges {
    CALayer *tintLayer = [[CALayer alloc] init];
    [tintLayer setBackgroundColor:[[UIColor whiteColor] CGColor]];
    [tintLayer setOpacity:KLB_FADE_IN_OPACITY_START];
    [tintLayer setBounds:[layer bounds]];
    // Center the tint layer
    [tintLayer setPosition:CGPointMake([layer bounds].size.width/2.0,
                                       [layer bounds].size.height/2.0)];
    
    [layer addSublayer:tintLayer];
    
    [CATransaction begin];
    
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    
    CAKeyframeAnimation *transparency = [[CAKeyframeAnimation alloc] init];
    
    transparency.fillMode = kCAFillModeForwards;
    
    [transparency setKeyPath:keyPathTransparency];
    transparency.duration = KLB_FLASH_WHITE_DURATION;
    
    NSMutableArray *transparencyValues = [[NSMutableArray alloc] init];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FADE_IN_OPACITY_START]];
    [transparencyValues addObject:[NSNumber numberWithFloat:KLB_FLASH_WHITE_OPACITY]];

    transparency.values = transparencyValues;
    
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [transparencyValues release];
         [transparency release];
     }];
    
    [tintLayer addAnimation:transparency forKey:keyPathTransparency];
    
    [CATransaction commit];
}

+ (void)flashAlphaCALayer:(CALayer *)layer applyChanges:(BOOL)applyChanges {
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    // FADE IN
    CAKeyframeAnimation *fadeIn = [[CAKeyframeAnimation alloc] init];
    
    fadeIn.fillMode = kCAFillModeForwards;
    
    [fadeIn setKeyPath:keyPathTransparency];
    fadeIn.duration = KLB_FLASH_ALPHA_FADE_IN_DURATION;
    
    NSMutableArray *fadeInValues = [[NSMutableArray alloc] init];
    [fadeInValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_IN_OPACITY_START]];
    [fadeInValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_IN_OPACITY_END]];
    fadeIn.values = fadeInValues;
    
    // FADE OUT
    CAKeyframeAnimation *fadeOut = [[CAKeyframeAnimation alloc] init];
    
    [fadeOut setKeyPath:keyPathTransparency];
    fadeOut.duration = KLB_FLASH_ALPHA_FADE_OUT_DURATION;
    
    NSMutableArray *fadeOutValues = [[NSMutableArray alloc] init];
    [fadeOutValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_START]];
    [fadeOutValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END]];
    fadeOut.values = fadeOutValues;
    
    if (applyChanges) {
        [layer setOpacity:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END];
    }
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [fadeIn release];
         [fadeInValues release];
         [fadeOut release];
         [fadeOutValues release];
         
         if (applyChanges) {
             [layer setOpacity:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END];
         }
     }];
    
    [layer addAnimation:fadeIn forKey:keyPathTransparency];
    [layer addAnimation:fadeOut forKey:keyPathTransparency];
    
    [CATransaction commit];
}

+ (void)flashAlphaCALayer:(CALayer *)layer fadeInDuration:(CGFloat)fadeInDuration fadeOutDuration:(CGFloat)fadeOutDuration applyChangesFadeIn:(BOOL)applyChangesFadeIn applyChangesFadeOut:(BOOL)applyChangesFadeOut {
    NSString *keyPathTransparency = KLB_CA_OPACITY_STRING;
    // FADE IN
    CAKeyframeAnimation *fadeIn = [[CAKeyframeAnimation alloc] init];
    
    fadeIn.fillMode = kCAFillModeForwards;
    
    [fadeIn setKeyPath:keyPathTransparency];
    fadeIn.duration = fadeInDuration;
    
    NSMutableArray *fadeInValues = [[NSMutableArray alloc] init];
    [fadeInValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_IN_OPACITY_START]];
    [fadeInValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_IN_OPACITY_END]];
    fadeIn.values = fadeInValues;
    
    // FADE OUT
    CAKeyframeAnimation *fadeOut = [[CAKeyframeAnimation alloc] init];
    
    [fadeOut setKeyPath:keyPathTransparency];
    fadeOut.duration = fadeOutDuration;
    
    NSMutableArray *fadeOutValues = [[NSMutableArray alloc] init];
    [fadeOutValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_START]];
    [fadeOutValues addObject:[NSNumber numberWithFloat:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END]];
    fadeOut.values = fadeOutValues;
    
    if (applyChangesFadeIn) {
        [layer setOpacity:KLB_FLASH_ALPHA_FADE_IN_OPACITY_END];
    }
    if (applyChangesFadeOut) {
        [layer setOpacity:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END];
    }
    
    // This block repeats the animation but also randomizes the location and size of the cloud
    [CATransaction setCompletionBlock:^()
     {
         [fadeIn release];
         [fadeInValues release];
         [fadeOut release];
         [fadeOutValues release];
         
         if (applyChangesFadeIn) {
             [layer setOpacity:KLB_FLASH_ALPHA_FADE_IN_OPACITY_END];
         }
         if (applyChangesFadeOut) {
             [layer setOpacity:KLB_FLASH_ALPHA_FADE_OUT_OPACITY_END];
         }
     }];
    
    [layer addAnimation:fadeIn forKey:keyPathTransparency];
    [layer addAnimation:fadeOut forKey:keyPathTransparency];
    
    [CATransaction commit];
}
@end
