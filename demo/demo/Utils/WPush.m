//
//  WPush.m
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WPush.h"
#import <UserNotifications/UserNotifications.h>

@interface WPush()<UNUserNotificationCenterDelegate>

@end

@implementation WPush

+ (instancetype)sharePush {
    static WPush *w_push;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        w_push = [[super allocWithZone:NULL] init];
    });
    return w_push;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [WPush sharePush];
}

- (id)copyWithZone:(NSZone *)zone {
    return [WPush sharePush];
}

#pragma mark -
- (void)w_requestPushAuthorization {
    UNUserNotificationCenter *notiCenter = [UNUserNotificationCenter currentNotificationCenter];
    notiCenter.delegate = self;
    [notiCenter requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (YES == granted) {
            //注册 DeviceToken
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
            
            //本地推送
//            [self w_localPush];
        }
    }];
}

- (void)w_registerDeviceToken:(NSData *)deviceToken {
    
}

- (void)w_registerDeviceTokenError:(NSError *)error {
    
}

#pragma mark - UNUserNotificationCenterDelegate
//收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    // alert 显示弹窗
    completionHandler(UNNotificationPresentationOptionAlert);
}
//点击通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    // 业务逻辑
    // coding...
    // 清空角标数字
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    completionHandler();
}

#pragma mark - 本地推送实例
- (void)w_localPush {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"title";
    content.body = @"body";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:15.0f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"localRequest" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"本地推送发送失败");
            return ;
        }
        NSLog(@"本地推送发送成功");
    }];
}



@end
