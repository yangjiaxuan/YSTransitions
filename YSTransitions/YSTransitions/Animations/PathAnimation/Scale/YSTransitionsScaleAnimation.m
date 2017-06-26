//
//  YSTransitionsScaleAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsScaleAnimation.h"

@implementation YSTransitionsScaleAnimation

- (void)to_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    toView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    toView.alpha     = 0.2;
    [UIView animateWithDuration:self.duration animations:^{
        toView.alpha     = 1;
        toView.transform = CGAffineTransformMakeScale(1, 1);
    }completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}

- (void)back_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    [UIView animateWithDuration:self.duration animations:^{
        fromView.alpha     = 0.2;
        fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    }completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}

@end
