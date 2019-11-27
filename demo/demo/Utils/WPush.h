//
//  WPush.h
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPush : NSObject

+ (instancetype)sharePush;
- (void)w_requestPushAuthorization;
- (void)w_registerDeviceToken:(NSData *)deviceToken;
- (void)w_registerDeviceTokenError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
