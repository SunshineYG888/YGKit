


#import <Foundation/Foundation.h>

@interface YGAudioTool : NSObject

/* 播放音效 */
+ (void)playSoundWithURL:(NSURL *)url alert:(BOOL)isAlert;

/* 清空所有音效缓存 */
+ (void)clearMemory;

@end
