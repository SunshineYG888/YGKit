//
//  UIImage+Extension.m
//  YGKit
//
//  Created by yons on 16/5/2.
//  Copyright © 2016年 yg. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)rendImageWithView:(UIView *)view {
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)imageWithImageName:(NSString*)imageName andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor*)color {
    
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    CGFloat width = oldImage.size.width + 2 * borderWidth;
    CGFloat height = oldImage.size.height + 2 * borderWidth;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 绘制大圆
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, width, height));
    [color set];
    CGContextFillPath(context);
    
    // 裁剪小圆
    CGContextAddEllipseInRect(context, CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height));
    CGContextClip(context);
    [oldImage drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    
    // 获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
