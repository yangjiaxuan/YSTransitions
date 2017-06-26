//
//  UIView+YSTransitonsFrame.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "UIView+YSTransitonsFrame.h"

@implementation UIView (YSTransitonsFrame)
- (CGFloat)ysTransitions_x
{
    return self.frame.origin.x;
}

- (void)setYsTransitions_x:(CGFloat)ysTransitions_x
{
    CGRect frame = self.frame;
    frame.origin.x = ysTransitions_x;
    self.frame = frame;
}

- (CGFloat)ysTransitions_y
{
    return self.frame.origin.y;
}

- (void)setYsTransitions_y:(CGFloat)ysTransitions_y
{
    CGRect frame = self.frame;
    frame.origin.y = ysTransitions_y;
    self.frame = frame;
}

-(CGFloat)ysTransitions_width
{
    return self.frame.size.width;
}
-(void)setYsTransitions_width:(CGFloat)ysTransitions_width
{
    CGRect frame = self.frame;
    frame.size.width = ysTransitions_width;
    self.frame = frame;
}

- (CGFloat)ysTransitions_height
{
    return self.frame.size.height;
}
- (void)setYsTransitions_height:(CGFloat)ysTransitions_height
{
    CGRect frame = self.frame;
    frame.size.height = ysTransitions_height;
    self.frame = frame;
}
@end
