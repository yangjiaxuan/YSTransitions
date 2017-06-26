//
//  YSBaseAnimation.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSBaseAnimation.h"
#import "UINavigationController+YSTransitons.h"

@interface YSTransitionsCoolMoveModel()

// 需要动画的view 原父视图
@property (weak  , nonatomic) UIView *startSuperView;
// 需要动画的view
@property (weak  , nonatomic) UIView *startView;
// startView 在 fromView 中的 frame
@property (assign, nonatomic) CGRect  startViewFrame;
// 动画过程中 startView 在contentView 中 开始 的frame
@property (assign, nonatomic) CGRect  startViewFR;

@property (weak  , nonatomic) UIView *endSuperView;
@property (weak  , nonatomic) UIView *endView;
@property (assign, nonatomic) CGRect  endViewFrame;
@property (assign, nonatomic) CGRect  endViewFR;

@end
@implementation YSTransitionsCoolMoveModel
@end

@interface YSBaseAnimation()

@end

@implementation YSBaseAnimation
// 自定义子类的构造方法 子类重写
+ (id)transitionsAnimationWithDuration:(float)duration{
    
    return [[self alloc] init];
}

// 本类类簇 构造方法
+ (id)transitionsAnimationWithDuration:(float)duration animationType:(YSTransitionsAnimationType)animationType type:(YSTransitionsType)type direction:(YSTransitionsDirection)direction{

    NSArray *animationClasseStrings =
                                @[@"YSTransitionsMoveInAnimation",
                                  @"YSTransitionsMoveInAnimation",
                                  @"YSTransitionsCubeAnimation",
                                  @"YSTransitionsFadingAnimation",
                                  @"YSTransitionsFlipAnimation",
                                  @"YSTransitionsPageAnimation",
                                  @"YSTransitionsPushAnimation",
                                  @"YSTransitionsRippleAnimation",
                                  @"YSTransitionsSuckAnimation",
                                  @"YSTransitionsLinerAnimation",
                                  @"YSTransitionsScaleAnimation",
                                  @"YSTransitionsWindowAnimation"
                                  ];
    if ((NSInteger)type >= animationClasseStrings.count) {
        return nil;
    }
    NSString *animationClassString = animationClasseStrings[type];
    YSBaseAnimation *animation = [[NSClassFromString(animationClassString) alloc] init];
    animation.type          = type;
    animation.animationType = animationType;
    animation.duration      = duration;
    animation.direction     = direction;
    return animation;
}

#pragma mark: ------ UIViewControllerAnimatedTransitioning ------
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *contentView = [transitionContext containerView];
    UIView *fromView    = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView      = [transitionContext viewForKey:UITransitionContextToViewKey];

    [contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [contentView addSubview:toView];
    [contentView addSubview:fromView];

    if ([self.cooleMoveModels isKindOfClass:[NSArray class]]) {
        for (YSTransitionsCoolMoveModel *coolMoveModel in self.cooleMoveModels) {
            
            UIView *startView = [fromView viewWithTag:coolMoveModel.fromViewTag];
            UIView *endView   = [toView viewWithTag:coolMoveModel.toViewTag];
            if (startView && endView) {
                coolMoveModel.startSuperView = startView.superview;
                coolMoveModel.startView      = startView;
                coolMoveModel.startViewFrame = startView.frame;
                coolMoveModel.endSuperView   = endView.superview;
                coolMoveModel.endView        = endView;
                coolMoveModel.endViewFrame   = endView.frame;
                
                [startView removeFromSuperview];
                CGRect startViewFR = [fromView convertRect:startView.frame toView:contentView];
                coolMoveModel.startViewFR = startViewFR;
                [contentView addSubview:startView];
                startView.frame           = startViewFR;

                coolMoveModel.endViewFR   = [toView convertRect:endView.frame toView:contentView];
                endView.hidden            = YES;
            }
        }
        
        [UIView animateWithDuration:self.duration animations:^{
            for (YSTransitionsCoolMoveModel *coolMoveModel in self.cooleMoveModels) {
                coolMoveModel.startView.frame = coolMoveModel.endViewFR;
            }
        }];
    }
    
    dispatch_block_t complete = ^{
        for (YSTransitionsCoolMoveModel *coolMoveModel in self.cooleMoveModels) {
            coolMoveModel.startView.frame = coolMoveModel.startViewFrame;
            [coolMoveModel.startSuperView addSubview:coolMoveModel.startView];
            coolMoveModel.endView.hidden  = NO;
        }
        [transitionContext completeTransition:YES];
    };
    [self transitionsAnimationWithContentView:contentView fromView:fromView toView:toView complete:complete];
}

- (void)animationEnded:(BOOL)transitionCompleted{
    
    self.navigationController.ys_transitionHandler = nil;
}

#pragma mark: ------ UIViewControllerAnimatedTransitioning ------
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
}


// 子类重写
-(void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete{
    
}

@end
