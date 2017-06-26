//
//  YSTransitionsAnimation.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSBaseAnimation.h"


@interface YSTransitionsAnimation : YSBaseAnimation<CAAnimationDelegate>

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView transitionSetting:(TransitionSettingAction)transitionSetting completion:(dispatch_block_t)complete;

@end
