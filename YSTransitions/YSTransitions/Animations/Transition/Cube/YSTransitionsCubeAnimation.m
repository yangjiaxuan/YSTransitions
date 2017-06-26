//
//  YSTransitionsCubeBackAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsCubeAnimation.h"

@implementation YSTransitionsCubeAnimation
- (void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    [super transitionsAnimationWithContentView:contentView fromView:fromView toView:toView complete:complete];
    
    [super animationFromView:fromView toView:toView transitionSetting:^(CATransition *transition) {
        transition.type = @"cube";
    } completion:complete];
}

@end
