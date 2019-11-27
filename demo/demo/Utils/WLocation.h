//
//  WLocation.h
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLocation : NSObject
+ (instancetype)shareLocation;
- (void)w_requestLocationAuthorization;
@end

NS_ASSUME_NONNULL_END
