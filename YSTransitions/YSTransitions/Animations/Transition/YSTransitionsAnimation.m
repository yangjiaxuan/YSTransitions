//
//  YSTransitionsAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsAnimation.h"

@interface YSTransitionsAnimation()
{
    UIView *_newContentView;
    __weak UIView *_contentView;
    __weak UIView *_fromView;
    __weak UIView *_toView;
}
@property(copy, nonatomic) dispatch_block_t complete;

@end

@implementation YSTransitionsAnimation

- (void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
    _fromView       = fromView;
    _toView         = toView;
    _contentView    = fromView.superview;
    
    [_fromView removeFromSuperview];
    [_toView   removeFromSuperview];
    
    _newContentView = [[UIView alloc] initWithFrame:_contentView.bounds];
    [_newContentView addSubview:fromView];
    [_contentView insertSubview:_newContentView atIndex:0];
}

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView transitionSetting:(TransitionSettingAction)transitionSetting completion:(dispatch_block_t)complete{

    _complete = complete;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setAnimationsWithSetting:transitionSetting];
    });
}

- (void)setAnimationsWithSetting:(TransitionSettingAction)transitionSetting{
    
    [_newContentView addSubview:_toView];

    CATransition *transitrion = [[CATransition alloc]init];
    transitrion.duration      = self.duration;
    
    YSTransitionsDirection direction = self.direction;
    if (self.animationType == YSTransitionsAnimationTypeBack) {
        direction = 3 - direction;
    }
    switch (direction) {
        case YSTransitionsDirectionTop:
            transitrion.subtype = kCATransitionFromTop;
            break;
        case YSTransitionsDirectionLeft:
            transitrion.subtype = kCATransitionFromLeft;
            break;
        case YSTransitionsDirectionBottom:
            transitrion.subtype = kCATransitionFromBottom;
            break;
        case YSTransitionsDirectionRight:
            transitrion.subtype = kCATransitionFromRight;
            break;
    }
    
    transitrion.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    transitrion.type = @"cube";
    transitrion.removedOnCompletion = NO;
    transitrion.delegate = self;
    if (transitionSetting) {
        transitionSetting(transitrion);
    }
    [_newContentView.layer addAnimation:transitrion forKey:transitrion.type];
}

// 动画代理
- (void)animationDidStart:(CAAnimation *)anim{

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [_contentView addSubview:_toView];
    [_newContentView removeFromSuperview];
    self.complete();
}


@end
