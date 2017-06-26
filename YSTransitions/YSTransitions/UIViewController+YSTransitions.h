//
//  UIViewController+YSTransitions.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSBaseAnimation.h"
#import "YSTransitionsHandler.h"

@interface UIViewController (YSTransitions)

@property (strong, nonatomic) YSTransitionsHandler *ys_transitionHandler;

- (void)ys_presentViewController:(UIViewController *)viewControllerToPresent withAnimation:(YSBaseAnimation *)animation completion:(void (^)(void))completion;

- (void)ys_dismissViewControllerWithAnimation:(YSBaseAnimation *)animation completion:(void (^)(void))completion;

@end
