//
//  YSTransitionsNavgationHandler.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YSBaseAnimation;
@protocol UINavigationControllerDelegate;
@protocol UIViewControllerTransitioningDelegate;

@interface YSTransitionsHandler : NSObject<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

+ (id)transitionsHandler;

@property (strong, nonatomic) YSBaseAnimation *transitionsAnimation;

@end
