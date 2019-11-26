//
//  WMediator.m
//  demo
//
//  Created by wiley on 2019/11/26.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WMediator.h"

@implementation WMediator

+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

#pragma mark - target action
- (__kindof UIViewController *)viewControllerWithParameterA:(NSString *)parameterA parameterB:(NSString *)parameterB {
    Class VC = NSClassFromString(@"ViewController");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    //最多传两个参数
    UIViewController *controller = [[VC alloc] performSelector:NSSelectorFromString(@"initWithParameterA:ParameterB:") withObject:parameterA withObject:parameterB];
#pragma clang diagnostic pop
    return controller;
}

#pragma mark - url scheme
+ (void)registerScheme:(NSString *)scheme processBlock:(WMediatorProcessBlock)processBlock{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    WMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

#pragma mark - protol class
+ (void)registerProtocol:(Protocol *)protocol withClass:(Class)cls {
    if (protocol && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(protocol)];
    }
}
+ (Class)classForProtocol:(Protocol *)protocol{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(protocol)];
}

@end
