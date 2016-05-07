//
//  UIImage+Extension.h
//  YGKit
//
//  Created by yons on 16/5/2.
//  Copyright © 2016年 yg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/* 截屏: 大小为 view 的大小，返回图片 */
+ (UIImage *)rendImageWithView:(UIView *)view;

/* 将图片截成圆形，并加上圆形边框，返回新图片 */
+ (instancetype)imageWithImageName:(NSString*)imageName andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor*)color;

@end
