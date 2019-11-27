//
//  WUIAdapter.h
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

#define IS_IPHONE_X_XR_XMAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [WAdapter sizeFor58Inch].width && SCREEN_HEIGHT == [WAdapter sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [WAdapter sizeFor61Inch].width && SCREEN_HEIGHT == [WAdapter sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [WAdapter sizeFor65Inch].width && SCREEN_HEIGHT == [WAdapter sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
# warning BigMode 放大模式适配

#define STATUSBAR_HEIGHT (IS_IPHONE_X_XR_XMAX ? 44 : 20)
#define HOME_INDICATOR_HEIGHT (IS_IPHONE_X_XR_XMAX ? (IS_LANDSCAPE ? 21 : 34) : 0)

static inline NSInteger W_Adapter (float x){
    CGFloat scale = 375 / SCREEN_WIDTH;
    return (NSInteger)x /scale;
}

static inline CGRect W_Rect(x,y,width,height){
    return CGRectMake(W_Adapter(x), W_Adapter(y), W_Adapter(width), W_Adapter(height));
}

static inline CGSize W_Size(width,height){
    return CGSizeMake(W_Adapter(width), W_Adapter(height));
}

static inline CGPoint W_Origin(x,y,width,height){
    return CGPointMake(W_Adapter(x), W_Adapter(y));
}

@interface WUIAdapter : NSObject

//iphone xs max
+ (CGSize)sizeFor65Inch;

//iphone xr
+ (CGSize)sizeFor61Inch;

// iphonex
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
