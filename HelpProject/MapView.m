//
//  MapView.m
//  HelpProject
//
//  Created by 许波波 on 16/6/3.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "MapView.h"
#import <CoreLocation/CoreLocation.h>

@interface MapView () <CLLocationManagerDelegate> {
    CLLocationManager * locationManger;
    CLGeocoder * gecoder;
}

@end
@implementation MapView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        locationManger = [[CLLocationManager alloc] init ];
        gecoder = [[CLGeocoder alloc] init];
//        [self getCoordinateByAdress:@"三门峡"];
//        [self getAdressByLatitude:39.54 longitude:116.28];
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"定位服务尚未打开");
            return nil;
        }
        //如果没有授权则请求用户授权
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            [locationManger requestWhenInUseAuthorization];
        }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
            locationManger.delegate = self;
            locationManger.desiredAccuracy = kCLLocationAccuracyBest;
            CLLocationDistance distance = 10.0;
            locationManger.distanceFilter = distance;
            [locationManger startUpdatingLocation];
        }
    }
    return self;
}

- (void)getCoordinateByAdress:(NSString *)addressString
{
    [gecoder geocodeAddressString:addressString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
        CLPlacemark * placeMark = [placemarks firstObject];
//        CLLocation * location = placeMark.location;//位置
//        CLRegion * region = placeMark.region;//区域
        NSDictionary * addressDic = placeMark.addressDictionary;////详细地址信息字典,
        for (NSArray * string in addressDic.allValues) {
            NSLog(@"%@",string);
        }
//        NSLog(@"位置：%@，区域：%@，详细信息：%@",location,region,addressDic);
    }];
}

- (void)getAdressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees) longitude
{
    CLLocation * location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [gecoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark * placeMark = [placemarks firstObject];
        NSDictionary * addressDic = placeMark.addressDictionary;////详细地址信息字典,
        for (NSArray * string in addressDic.allValues) {
            NSLog(@"%@",string);
        }
    }];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation * location = [locations firstObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    [self getAdressByLatitude:coordinate.latitude longitude:coordinate.longitude];
//    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    [locationManger stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }else if ([error code] == kCLErrorNetwork){
        NSLog(@"网络问题");
    }else if ([error code] == kCLErrorLocationUnknown) {
          NSLog(@"无法获取位置信息");
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
