


/* 单例的声明 */

#define singleton_h(name) + (instancetype)shared##name;

/* 单例的实现 */

#if __has_feature(objc_arc)     // ARC

#define singleton_m(name)                               \
static id _instance;                                    \
+ (instancetype)shared##name{                           \
    static dispatch_once_t oneToken;                    \
    dispatch_once(&oneToken, ^{                         \
        _instance = [[self alloc] init];                \
    });                                                 \
    return _instance;                                   \
}                                                       \
+ (instancetype)allocWithZone:(struct _NSZone *)zone{   \
    static dispatch_once_t oneToken;                    \
    dispatch_once(&oneToken, ^{                         \
        _instance = [[super allocWithZone:zone] init];  \
    });                                                 \
    return _instance;                                   \
}                                                       \
- (id)copyWithZone:(NSZone *)zone{                      \
    return _instance;                                   \
}

#else                               // MRC

#define singleton_m(name)                               \
static id _instance;                                    \
+ (instancetype)shared##name{                           \
    static dispatch_once_t oneToken;                    \
    dispatch_once(&oneToken, ^{                         \
        _instance = [[self alloc] init];                \
    });                                                 \
    return _instance;                                   \
}                                                       \
+ (instancetype)allocWithZone:(struct _NSZone *)zone{   \
    static dispatch_once_t oneToken;                    \
    dispatch_once(&oneToken, ^{                         \
        _instance = [[super allocWithZone:zone] init];  \
    });                                                 \
    return _instance;                                   \
}                                                       \
- (id)copyWithZone:(NSZone *)zone{                      \
    return _instance;                                   \
}                                                       \
- (oneway void)release{                                 \
}                                                       \
- (instancetype)retain{                                 \
    return _instance;                                   \
}                                                       \
- (NSUInteger)retainCount{                              \
    return 1;                                           \
}                                                       \
- (instancetype)autorelease{                            \
    return _instance;                                   \
}

#endif

