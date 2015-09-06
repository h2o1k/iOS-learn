//
//  FiveViewController.h
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Annotation.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FiveViewController : BaseViewController<MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView *_mapView; // 地图显示
    UILabel *_locationLabel;  // 定位状态
    NSMutableArray *_annotations; // 标注的地点数组
}

@property(nonatomic, strong) CLLocationManager *locationManager; // 位置管理器
@property(nonatomic, strong) CLLocation *currentLocation; // 当前位置
@property(nonatomic, strong) CLGeocoder *geocoder;

@end
