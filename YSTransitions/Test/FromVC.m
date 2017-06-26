//
//  FromVC.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "FromVC.h"
#import "ToVC.h"


@interface FromVC ()
{
    BOOL _isPresent;
    UILabel *_modeLabel;
}
@end

@implementation FromVC

+ (id)controller{

    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"FromVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"fromView";
    
    UIImage *image = [UIImage imageNamed:@"03.png"];
    self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    UIView *fromView = [[UIView alloc] initWithFrame:CGRectMake(200, 300, 100, 120)];
    fromView.tag     = 100;
    fromView.layer.contents  = (__bridge id _Nullable)([UIImage imageNamed:@"08.png"].CGImage);
    [self.view addSubview:fromView];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.placeholder  = @"这是一个 UITextField";
    tf.tag          = 101;
    [self.view addSubview:tf];
    
    _isPresent = NO;
    _modeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.ysTransitions_width - 120, 70, 110, 30)];
    _modeLabel.text                 = @"导航切换";
    _modeLabel.textAlignment        = NSTextAlignmentCenter;
    _modeLabel.textColor            = [UIColor whiteColor];
    _modeLabel.backgroundColor      = [UIColor purpleColor];
    _modeLabel.layer.cornerRadius   = 13;
    _modeLabel.layer.masksToBounds  = YES;
    [self.view addSubview:_modeLabel];
                                    
    UISwitch *switcher = [[UISwitch alloc] initWithFrame:CGRectMake(_modeLabel.ysTransitions_x, CGRectGetMaxY(_modeLabel.frame)+5, 70, 30)];
    switcher.ysTransitions_x += 10;
    [switcher addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switcher];
}

- (void)switchAction:(UISwitch *)sender{
    if (!sender.isOn) {
        _modeLabel.text = @"导航切换";
        _isPresent      = NO;
    }
    else{
        _modeLabel.text = @"模态切换";
        _isPresent      = YES;
    }
}

- (void)next{

    ToVC *toVC = [ToVC controller];
    toVC.type  = self.type;
    toVC.direction = self.direction;
    
    YSTransitionsCoolMoveModel *coolMoveModel_01 = [[YSTransitionsCoolMoveModel alloc] init];
    coolMoveModel_01.fromViewTag  = 100;
    coolMoveModel_01.toViewTag    = 100;
    
    YSTransitionsCoolMoveModel *coolMoveModel_02 = [[YSTransitionsCoolMoveModel alloc] init];
    coolMoveModel_02.fromViewTag  = 101;
    coolMoveModel_02.toViewTag    = 101;

    YSBaseAnimation *animation = [YSBaseAnimation transitionsAnimationWithDuration:0.5 animationType:YSTransitionsAnimationTypeTo type:self.type direction:self.direction];
    animation.cooleMoveModels  = @[coolMoveModel_01, coolMoveModel_02];
    if (_isPresent) {
        [self ys_presentViewController:toVC withAnimation:animation completion:nil];
    }
    else{
        [self.navigationController ys_pushViewController:toVC withAnimation:animation];
    }
}

@end
