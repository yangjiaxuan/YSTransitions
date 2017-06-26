//
//  UINavigationController+YSTransitons.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+YSTransitions.h"

@class YSTransitionsHandler;
@interface UINavigationController (YSTransitons)

- (void)ys_pushViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation;

- (void)ys_popViewControllerWithAnimation:(YSBaseAnimation *)animation;

- (void)ys_popToRootViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation;

- (void)ys_popToViewController:(UIViewController *)viewController withAnimation:(YSBaseAnimation *)animation;

@end
