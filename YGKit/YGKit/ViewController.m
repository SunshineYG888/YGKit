//
//  ViewController.m
//  YGKit
//
//  Created by yons on 16/5/2.
//  Copyright © 2016年 yg. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithImageName:@"icon" andBorderWidth:10 andBorderColor:[UIColor orangeColor]];
    [self rendImageAndSaved];
}

- (void)rendImageAndSaved {
    UIImage *newImage = [UIImage rendImageWithView:self.view];
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/yons/Desktop/layer.png" atomically:YES];
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), @"image");
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"error");
    } else {
        NSLog(@"success: %@", contextInfo);
    }
}

@end
