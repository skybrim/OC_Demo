//
//  WLocation.m
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface WLocation()<NSCopying,CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;
@end

@implementation WLocation

+ (instancetype)shareLocation {
    static WLocation *w_location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        w_location = [[super allocWithZone:NULL] init];
        w_location.manager = [[CLLocationManager alloc] init];
        w_location.manager.delegate = w_location;
    });
    return w_location;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [WLocation shareLocation];
}

- (id)copyWithZone:(NSZone *)zone {
    return [WLocation shareLocation];
}

#pragma mark - 主动请求位置服务
- (void)w_requestLocationAuthorization {
    //判断系统是否开启定位权限
    if(![CLLocationManager locationServicesEnabled]){
        //跳转到设置界面，引导用户打开权限
    }
    //第一次请求定位权限，根据需求，请求不同级别的定位权限，需要 info.plist 里加入相关设置
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        [self.manager requestWhenInUseAuthorization];
    }
}

#pragma mark - CLLocationManagerDelegate
//通过回调监听位置权限
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager startUpdatingLocation];//获取地理位置
    } else if (status == kCLAuthorizationStatusDenied) {
        //被禁止
    }
}
//获取地理位置回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //地理信息
    CLLocation *location = [locations firstObject];
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //地标信息
        if (error) {
            NSLog(@"error -- \n%@", error);
            return ;
        }
        NSLog(@"placemarks -- \n%@", placemarks);
    }];
    [self.manager stopUpdatingLocation];//挺直获取
}
@end
