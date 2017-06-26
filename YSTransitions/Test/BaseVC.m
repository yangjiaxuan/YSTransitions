//
//  BaseVC.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

+ (id)controller{

    return [[self alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *backBtn = [self createBtnWithFrame:CGRectMake(30, 200, 60, 25) title:@"back" action:@selector(back)];
    [self.view addSubview:backBtn];
    
    NSInteger screenW = [UIScreen mainScreen].bounds.size.width;
    UIButton *nextBtn = [self createBtnWithFrame:CGRectMake(screenW - 85, 200, 60, 25) title:@"next" action:@selector(next)];
    [self.view addSubview:nextBtn];
}

- (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title action:(SEL)action{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame     = frame;
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)next{}

@end
