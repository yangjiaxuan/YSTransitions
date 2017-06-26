//
//  UIViewController+YSTransitions.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "UIViewController+YSTransitions.h"
#import <objc/runtime.h>

@implementation UIViewController (YSTransitions)

- (YSTransitionsHandler *)ys_transitionHandler{
    
    return objc_getAssociatedObject(self, "ys_transitionHandler");
}

- (void)setYs_transitionHandler:(YSTransitionsHandler *)ys_transitionHandler{
    
    objc_setAssociatedObject(self, "ys_transitionHandler", ys_transitionHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ys_presentViewController:(UIViewController *)viewControllerToPresent withAnimation:(YSBaseAnimation *)animation completion:(void (^)(void))completion{

    [self ys_toViewController:viewControllerToPresent withAnimation:animation isPresent:YES completion:completion];
}

- (void)ys_dismissViewControllerWithAnimation:(YSBaseAnimation *)animation completion:(void (^)(void))completion{
    
    [self ys_toViewController:nil withAnimation:animation isPresent:NO completion:completion];
}

- (void)ys_toViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation isPresent:(BOOL)isPresent completion:(void (^)(void))completion{
    if (animation) {
        YSTransitionsHandler *transitionsHandler = [YSTransitionsHandler transitionsHandler];
        transitionsHandler.transitionsAnimation  = animation;
        self.ys_transitionHandler  = transitionsHandler;
        self.transitioningDelegate = transitionsHandler;
        viewController.transitioningDelegate = transitionsHandler;
    }
    if (isPresent) {
        [self presentViewController:viewController animated:YES completion:completion];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:completion];
    }
}

@end
