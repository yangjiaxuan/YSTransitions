//
//  ToVC.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "ToVC.h"
#import "YSTransitions.h"

@interface ToVC ()

@end

@implementation ToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"toView";
    
    UIImage *image = [UIImage imageNamed:@"10.png"];
    self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(40, 400, 150, 30)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.placeholder  = @"这是一个 UITextField";
    tf.tag          = 101;
    [self.view addSubview:tf];

    
    UIView *fromView = [[UIView alloc] initWithFrame:CGRectMake(200, 400, 160, 200)];
    fromView.tag     = 100;
    fromView.layer.contents  = (__bridge id _Nullable)([UIImage imageNamed:@"08.png"].CGImage);
    [self.view addSubview:fromView];
}

- (void)back{
    
    YSTransitionsCoolMoveModel *coolMoveModel_01 = [[YSTransitionsCoolMoveModel alloc] init];
    coolMoveModel_01.fromViewTag  = 100;
    coolMoveModel_01.toViewTag    = 100;
    
    YSTransitionsCoolMoveModel *coolMoveModel_02 = [[YSTransitionsCoolMoveModel alloc] init];
    coolMoveModel_02.fromViewTag  = 101;
    coolMoveModel_02.toViewTag    = 101;
    
    YSBaseAnimation *animation = [YSBaseAnimation transitionsAnimationWithDuration:0.5 animationType:YSTransitionsAnimationTypeBack type:self.type direction:self.direction];
    animation.cooleMoveModels  = @[coolMoveModel_01, coolMoveModel_02];
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController ys_popViewControllerWithAnimation:animation];
    }
    else{
        [self ys_dismissViewControllerWithAnimation:animation completion:nil];
    }
}

@end
