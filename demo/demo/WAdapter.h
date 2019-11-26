//
//  WAdapter.h
//  demo
//
//  Created by wiley on 2019/11/26.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.height : [[UIScreen mainScreen ] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.width : [[UIScreen mainScreen ] bounds].size.height)

#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

static inline NSInteger W_Adapter (float x){
    CGFloat scale = 375 / SCREEN_WIDTH;
    return (NSInteger)x /scale;
}

//...完善其他方法..size..rect..origin..
static inline CGRect W_RectAdapter(x,y,width,height){
    return CGRectMake(W_Adapter(x), W_Adapter(y), W_Adapter(width), W_Adapter(height));
}

@interface WAdapter : NSObject

//iphone xs max
+ (CGSize)sizeFor65Inch;

//iphone xr
+ (CGSize)sizeFor61Inch;

// iphonex
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
