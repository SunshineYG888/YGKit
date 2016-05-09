


#import "YGAudioTool.h"
#import <AVFoundation/AVFoundation.h>

static NSMutableDictionary *_cacheDict;

@implementation YGAudioTool

/*
 缓存策略: 用一个字典做缓存, 使用 URL 做 key,用 soundID 做 value.
 创建字典: 在使用类的时候创建,而且只创建一次.所以放在 initialize 中(load 是只要头文件参与了编译就调用,即使不引用头文件)
 使用字典: 使用前判断 soundID 前判断缓存中是否有对应的值, 创建 soundID 后保存到字典中
 */
+ (void)initialize {
    _cacheDict = [NSMutableDictionary dictionary];
}

/*
 播放音效方法步骤:(使用 C API)
 1. 导入 AVFoundation 框架
 2. 创建音效文件
 3. 播放
 */
+ (void)playSoundWithURL:(NSURL *)url alert:(BOOL)isAlert{
    // 1. 创建系统声音 ID
    // 1.1 URL 地址: 文件的路径
    
    // 1.2 SystemSoundID: 系统声音 ID, 可以理解为 cell 的重用标识符, 是 UInt32.
    NSString *urlStr = url.absoluteString;
    SystemSoundID soundID = [_cacheDict[urlStr] intValue];
    
    // 1.3 如果没保存过此 soundID, 则根据 URL 地址创建
    if (soundID == 0) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
        _cacheDict[urlStr] = @(soundID);
    }
    
    // 2. 播放音效
    if (isAlert) {
        AudioServicesPlayAlertSound(soundID);
    } else {
        AudioServicesPlaySystemSound(soundID);
    }
}

/* 清空所有音效缓存 */
+ (void)clearMemory {
    [_cacheDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        AudioServicesDisposeSystemSoundID([obj intValue]);
    }];
    
    // 2. 清除字典对象
    [_cacheDict removeAllObjects];
}

@end
