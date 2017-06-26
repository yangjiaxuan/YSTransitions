//
//  YSTransitionsWindowAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsWindowAnimation.h"
#import "UIView+YSTransitonsScreenShot.h"

@implementation YSTransitionsWindowAnimation

- (void)to_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    fromView.hidden   = YES;
    toView.transform  = CGAffineTransformMakeScale(0.8, 0.8);
    
    NSInteger screenW = [UIScreen mainScreen].bounds.size.width;
    NSInteger viewY   = fromView.ysTransitions_y;
    NSInteger viewW   = fromView.ysTransitions_width/2;
    NSInteger viewH   = fromView.ysTransitions_height;
    
    CGRect   leftViewSF  = CGRectMake(0, viewY, viewW, viewH);
    CGRect   rightViewSF = CGRectMake(viewW, viewY, viewW, viewH);
    CGRect   leftViewEF  = CGRectMake(-viewW, viewY, viewW, viewH);
    CGRect   rightViewEF = CGRectMake(screenW+viewW, viewY, viewW, viewH);
    
    UIImage *leftImage   = [fromView YST_screenShotWithFrame:CGRectMake(0, 0, viewW, viewH)];
    UIImage *rightImage  = [fromView YST_screenShotWithFrame:CGRectMake(viewW, 0, viewW, viewH)];

    UIImageView *leftView  = [[UIImageView alloc] initWithFrame:leftViewSF];
    leftView.image         = leftImage;
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:rightViewSF];
    rightView.image        = rightImage;

    [contentView insertSubview:leftView  aboveSubview:toView];
    [contentView insertSubview:rightView aboveSubview:toView];

    [UIView animateWithDuration:self.duration animations:^{
        leftView.frame   = leftViewEF;
        rightView.frame  = rightViewEF;
        toView.transform = CGAffineTransformMakeScale(1, 1);
    }completion:^(BOOL finished) {
        fromView.hidden  = NO;
        [leftView  removeFromSuperview];
        [rightView removeFromSuperview];
        if (complete) {
            complete();
        }
    }];
}

- (void)back_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    toView.hidden = YES;

    NSInteger screenW = [UIScreen mainScreen].bounds.size.width;
    NSInteger viewY   = fromView.ysTransitions_y;
    NSInteger viewW   = fromView.ysTransitions_width/2;
    NSInteger viewH   = fromView.ysTransitions_height;
    
    CGRect   leftViewSF  = CGRectMake(-viewW, viewY, viewW, viewH);
    CGRect   rightViewSF = CGRectMake(screenW+viewW, viewY, viewW, viewH);
    CGRect   leftViewEF  = CGRectMake(0, viewY, viewW, viewH);
    CGRect   rightViewEF = CGRectMake(viewW, viewY, viewW, viewH);

    UIImage *leftImage   = [toView YST_screenShotWithFrame:CGRectMake(0, 0, viewW, viewH)];
    UIImage *rightImage  = [toView YST_screenShotWithFrame:CGRectMake(viewW, 0, viewW, viewH)];
    
    UIImageView *leftView  = [[UIImageView alloc] initWithFrame:leftViewSF];
    leftView.image         = leftImage;
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:rightViewSF];
    rightView.image        = rightImage;
    
    [contentView insertSubview:leftView  aboveSubview:fromView];
    [contentView insertSubview:rightView aboveSubview:fromView];
    
    [UIView animateWithDuration:self.duration animations:^{
        leftView.frame     = leftViewEF;
        rightView.frame    = rightViewEF;
        fromView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    }completion:^(BOOL finished) {
        [contentView bringSubviewToFront:toView];
        toView.hidden = NO;
        if (complete) {
            complete();
        }
        [leftView  removeFromSuperview];
        [rightView removeFromSuperview];
    }];
}

@end
