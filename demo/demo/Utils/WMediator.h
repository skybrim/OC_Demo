//
//  WMediator.h
//  demo
//
//  Created by wiley on 2019/11/26.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

@interface WMediator : NSObject

#pragma mark - target action
- (__kindof UIViewController *)viewControllerWithParameterA:(NSString *)parameterA parameterB:(NSString *)parameterB;

#pragma mark - url scheme
typedef void(^WMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(WMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

#pragma mark - url scheme
+ (void)registerProtocol:(Protocol *)protocol withClass:(Class)cls;
+ (Class)classForProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
