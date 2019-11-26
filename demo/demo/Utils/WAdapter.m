//
//  WAdapter.m
//  demo
//
//  Created by wiley on 2019/11/26.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WAdapter.h"

@implementation WAdapter

//iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414,896);
}

//iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414,896);
}

// iphonex
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375,812);
}

@end
