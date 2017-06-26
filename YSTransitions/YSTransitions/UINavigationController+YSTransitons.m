//
//  UINavigationController+YSTransitons.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "UINavigationController+YSTransitons.h"
#import "YSTransitionsHandler.h"
#import <objc/runtime.h>

@implementation UINavigationController (YSTransitons)

- (void)ys_pushViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation{

    [self ys_toViewController:viewController withAnimation:animation isPush:YES];
}

- (void)ys_popViewControllerWithAnimation:(YSBaseAnimation *)animation{

    NSArray *controllers = self.viewControllers;
    if (controllers.count > 1) {
        UIViewController *topVC = controllers[controllers.count - 2];
        [self ys_popToViewController:topVC withAnimation:animation];
    }
}

- (void)ys_popToRootViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation{
    UIViewController *topVC = self.viewControllers.firstObject;
    [self ys_popToViewController:topVC withAnimation:animation];
}

- (void)ys_popToViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation{
    [self ys_toViewController:viewController withAnimation:animation isPush:NO];
}

- (void)ys_toViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation isPush:(BOOL)isPush{
    if (animation) {
        animation.navigationController = self;
        YSTransitionsHandler *transitionsHandler = [YSTransitionsHandler transitionsHandler];
        transitionsHandler.transitionsAnimation = animation;
        self.delegate             = transitionsHandler;
        self.ys_transitionHandler = transitionsHandler;
    }
    if (isPush) {
        [self pushViewController:viewController animated:YES];
    }
    else{
        [self popToViewController:viewController animated:YES];
    }
}

@end
