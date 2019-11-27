//
//  WLocation.m
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WLocation.h"

@interface WLocation()<NSCopying>

@end

@implementation WLocation

+ (instancetype)shareLocation {
    static WLocation *w_location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        w_location = [[super allocWithZone:NULL] init];
    });
    return w_location;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [WLocation shareLocation];
}

- (id)copyWithZone:(NSZone *)zone {
    return [WLocation shareLocation];
}
@end
