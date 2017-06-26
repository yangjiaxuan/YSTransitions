//
//  YSBaseAnimation.h
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YSTransitionsType.h"
#import "UIView+YSTransitonsFrame.h"


@interface YSTransitionsCoolMoveModel : NSObject

/**
 *  场景：
 *  由 A Viewcontroller 跳至 B Viewcontroller
 *  A 中 有 a View 需要移至 B 的 b View处。
 *  fromViewTag: a的tag值， 在 A.view 下，此值唯一
 *  toViewTag  : b的tag值， 在 B.view 下，此值唯一
 */
// 当前视图中需要转场的视图 tag值，保持在当前控制器视图中唯一
@property (assign, nonatomic) NSInteger fromViewTag;

// 目标视图中 目标位置视图 tag 值，保持在目标控制器视图中唯一
@property (assign, nonatomic) NSInteger toViewTag;

@end

@interface YSBaseAnimation : NSObject<UIViewControllerInteractiveTransitioning, UIViewControllerAnimatedTransitioning>


@property (weak  , nonatomic) UINavigationController *navigationController;

// 动画类型 是去（push/present） 还是回（pop/dismiss）
@property (assign, nonatomic) YSTransitionsAnimationType animationType;
// 动画时间
@property (assign, nonatomic) float duration;
// 动画方向 并不是所有的动画都有方向
@property (assign, nonatomic) YSTransitionsDirection direction;
// 转场类型
@property (assign, nonatomic) YSTransitionsType      type;


@property (strong, nonatomic) NSArray <YSTransitionsCoolMoveModel *>*cooleMoveModels;


// 自定义子类的构造方法 子类重写
+ (id)transitionsAnimationWithDuration:(float)duration;

// 本类类簇 构造方法
+ (id)transitionsAnimationWithDuration:(float)duration animationType:(YSTransitionsAnimationType)animationType type:(YSTransitionsType)type direction:(YSTransitionsDirection)direction;


// 子类重写
- (void)transitionsAnimationWithContentView:(UIView *)contentView fromView:(UIView *)fromView toView:(UIView *)toView complete:(dispatch_block_t)complete;

@end
