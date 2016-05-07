//
//  YGAudioTool.h
//  0427_02_小球移动
//
//  Created by male on 16/5/6.
//  Copyright © 2016年 com.yg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGAudioTool : NSObject

/* 播放音效 */
+ (void)playSoundWithURL:(NSURL *)url alert:(BOOL)isAlert;

/* 清空所有音效缓存 */
+ (void)clearMemory;

@end
