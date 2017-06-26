//
//  YSTransitionsPageBackAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsPageAnimation.h"

@implementation YSTransitionsPageAnimation

- (void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    [super transitionsAnimationWithContentView:contentView fromView:fromView toView:toView complete:complete];
    
    __weak typeof(self)weakSelf = self;
    [super animationFromView:fromView toView:toView transitionSetting:^(CATransition *transition) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf.animationType == YSTransitionsAnimationTypeBack) {
            transition.type = @"pageUnCurl";
        }
        else{
            transition.type = @"pageCurl";
        }
    } completion:complete];
}

@end
