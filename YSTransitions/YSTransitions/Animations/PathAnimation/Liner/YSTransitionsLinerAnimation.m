//
//  YSTransitionsLinerFromAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsLinerAnimation.h"

@implementation YSTransitionsLinerAnimation

- (void)to_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    switch (self.direction) {
        case YSTransitionsDirectionTop:
            toView.ysTransitions_y = -YSTransitions_ScreenH;
            break;
        case YSTransitionsDirectionLeft:
            toView.ysTransitions_x = -YSTransitions_ScreenW;
            break;
        case YSTransitionsDirectionBottom:
            toView.ysTransitions_y = YSTransitions_ScreenH;
            break;
        case YSTransitionsDirectionRight:
            toView.ysTransitions_x = YSTransitions_ScreenW;
            break;
    }
    [UIView animateWithDuration:self.duration animations:^{
        toView.ysTransitions_x = 0;
        toView.ysTransitions_y = 0;
    }completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
    
}

- (void)back_transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    [UIView animateWithDuration:self.duration animations:^{
        switch (self.direction) {
            case YSTransitionsDirectionTop:
                fromView.ysTransitions_y = -YSTransitions_ScreenH;
                break;
            case YSTransitionsDirectionLeft:
                fromView.ysTransitions_x = -YSTransitions_ScreenW;
                break;
            case YSTransitionsDirectionBottom:
                fromView.ysTransitions_y = YSTransitions_ScreenH;
                break;
            case YSTransitionsDirectionRight:
                fromView.ysTransitions_x = YSTransitions_ScreenW;
                break;
        }
    }completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}

@end
