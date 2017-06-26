//
//  YSTransitionsType.h
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

typedef NS_ENUM(NSInteger, YSTransitionsDirection){
    
    YSTransitionsDirectionLeft  = 0,   // 左
    YSTransitionsDirectionTop,         // 上
    YSTransitionsDirectionBottom,      // 下
    YSTransitionsDirectionRight,       // 右

};

typedef NS_ENUM(NSInteger, YSTransitionsType){
    
    YSTransitionsTypeDefault = 0,
    YSTransitionsTypeMoveIn,
    YSTransitionsTypeCube,
    YSTransitionsTypeFading,
    YSTransitionsTypeFlip,
    YSTransitionsTypePage,
    YSTransitionsTypePush,
    YSTransitionsTypeRipple,
    YSTransitionsTypeSuck,
    YSTransitionsTypeliner,
    YSTransitionsTypeScale,
    YSTransitionsTypeWindow
};

typedef NS_ENUM(NSInteger, YSTransitionsAnimationType){
    
    YSTransitionsAnimationTypeTo    = 0,
    YSTransitionsAnimationTypeBack  = 1,
};

typedef void(^TransitionSettingAction)(CATransition *transition);

#ifndef YSTransitions_ScreenW

#define YSTransitions_ScreenW ([UIScreen mainScreen].bounds.size.width)
#define YSTransitions_ScreenH ([UIScreen mainScreen].bounds.size.height)

#endif
