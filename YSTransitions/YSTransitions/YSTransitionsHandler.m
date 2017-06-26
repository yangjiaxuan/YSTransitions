//
//  YSTransitionsNavgationHandler.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSTransitionsHandler.h"
#import "YSBaseAnimation.h"
#import <UIKit/UIKit.h>

@interface YSTransitionsHandler()
@end

@implementation YSTransitionsHandler

+ (id)transitionsHandler{

    return [[self alloc] init];
}
#pragma mark ------- Transitioning Delegate (Modal) ------
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self.transitionsAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return self.transitionsAnimation;
}

#pragma mark ------- Navigation Controller Delegate ------
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

}

/*
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {

    return self.transitionsAnimation;
}
*/

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC  {
    
    return self.transitionsAnimation;
}

@end
