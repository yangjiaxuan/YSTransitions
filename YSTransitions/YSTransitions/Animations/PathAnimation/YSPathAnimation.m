//
//  YSPathAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSPathAnimation.h"

@implementation YSPathAnimation

- (void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.animationType == YSTransitionsAnimationTypeTo) {
            [contentView insertSubview:toView aboveSubview:fromView];
            [self to_transitionsAnimationWithContentView:contentView fromView:fromView toView:toView complete:complete];
        }
        else{
            [contentView insertSubview:fromView aboveSubview:toView];
            [self back_transitionsAnimationWithContentView:contentView fromView:fromView toView:toView complete:complete];
        }
    });
}

- (void)to_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{}

- (void)back_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{}

@end
