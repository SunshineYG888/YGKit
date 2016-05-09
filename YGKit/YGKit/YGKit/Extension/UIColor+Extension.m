


#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)randomColor {
    CGFloat red = (float)arc4random_uniform(256) / 255.0;
    CGFloat green = (float)arc4random_uniform(256) / 255.0;
    CGFloat blue = (float)arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
