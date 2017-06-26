//
//  UIView+YSTransitonsScreenShot.m
//  YSTransitions
//
//  Created by yangsen on 17/6/22.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "UIView+YSTransitonsScreenShot.h"

@implementation UIView (YSTransitonsScreenShot)

- (UIImage *)YST_screenShot{

    return [self YST_screenShotWithFrame:self.bounds];
}

- (UIImage *)YST_screenShotWithFrame:(CGRect)frame{
    
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSInteger resultImageX = frame.origin.x * scale;
    NSInteger resultImageY = frame.origin.y * scale;
    NSInteger resultImageW = frame.size.width * scale;
    NSInteger resultImageH = frame.size.height * scale;
    
    UIImage *resultImage =[UIImage imageWithCGImage: CGImageCreateWithImageInRect(screenshot.CGImage, CGRectMake(resultImageX, resultImageY, resultImageW, resultImageH))];
    return resultImage;
}
@end
