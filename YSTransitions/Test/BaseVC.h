//
//  BaseVC.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSTransitions.h"

@interface BaseVC : UIViewController

@property (assign, nonatomic) YSTransitionsType type;
@property (assign, nonatomic) YSTransitionsDirection direction;

+ (id)controller;

- (void)back;
- (void)next;

@end
