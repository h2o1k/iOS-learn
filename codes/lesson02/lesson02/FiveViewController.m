//
//  FiveViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"Five";
    NSLog(@"%@ viewDidLoad", self.title);
    self.bgImageView.image = [UIImage imageNamed:@"bg5"];
    
    // 标注的3个坐标
    _annotations = [[NSMutableArray alloc] initWithCapacity:3];
    CLLocationCoordinate2D coordinate1 = {31.19434, 121.43203};
    Annotation *annotation1 = [[Annotation alloc] initWithCoordinate:coordinate1 title:@"徐汇区" subtitle:@"广元西路" index:0];
    [_annotations addObject:annotation1];
    CLLocationCoordinate2D coordinate2 = {31.19190, 121.43304};
    Annotation *annotation2 = [[Annotation alloc] initWithCoordinate:coordinate2 title:@"徐汇区" subtitle:@"东方曼哈顿" index:1];
    [_annotations addObject:annotation2];
    CLLocationCoordinate2D coordinate3 = {31.19223, 121.42847};
    Annotation *annotation3 = [[Annotation alloc] initWithCoordinate:coordinate3 title:@"徐汇区" subtitle:@"南丹路" index:2];
    [_annotations addObject:annotation3];
    
    // 获取当前view的宽度和高度
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // 显示地图
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 64, width, height - 64 - 49 - 50)];
    // _mapView.showsUserLocation = YES; // 是否一直开启定位  建议不要打开，耗电
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    // 定位当前页面
    CLLocationCoordinate2D coordinate = {31.19316, 121.43154};  // 坐标：伟经度
    MKCoordinateSpan span = {0.05, 0.05}; // 缩放级别
    MKCoordinateRegion  region = {coordinate, span};
    [_mapView setRegion:region];
    
    // 底部显示状态的label
    CGFloat label_y = _mapView.frame.origin.y + _mapView.frame.size.height;
    _locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, label_y, width, 50)];
    _locationLabel.textAlignment = NSTextAlignmentCenter;
    _locationLabel.backgroundColor = [UIColor cyanColor];
    _locationLabel.text = @"user's location";
    [self.view addSubview:_locationLabel];
    
    // 顶部的3个按钮
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc]initWithTitle:@"定位"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(locationButtonClicked:)];
    self.navigationItem.leftBarButtonItem = locationButton;
    UIBarButtonItem *flagButton = [[UIBarButtonItem alloc]initWithTitle:@"标注"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(flagButtonClicked:)];
    UIBarButtonItem *resolveButton = [[UIBarButtonItem alloc]initWithTitle:@"解析"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(resolveButtonClicked:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:resolveButton, flagButton, nil];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Custom event methods

// 解析按钮按下事件
- (void)resolveButtonClicked:(id)sender {
    NSLog(@"解析按钮按下");
    self.geocoder = [[CLGeocoder alloc]init];
    [self.geocoder reverseGeocodeLocation:self.currentLocation
                        completionHandler:^(NSArray *placemarks, NSError *error){
                            if (error) {
                                NSLog(@"%@", error.description);
                            } else {
                                if ([placemarks count] > 0) {
                                    CLPlacemark *placemark = [placemarks objectAtIndex:0];
                                    _locationLabel.text = placemark.country;
                                }
                            }
                        } ];
}

// 标注按钮按下事件
- (void)flagButtonClicked:(id)sender {
    NSLog(@"标注按钮按下");
    [_mapView removeAnnotations:_mapView.annotations];
    [_mapView addAnnotations:_annotations];
}

// 定位按钮按下事件
- (void)locationButtonClicked:(id)sender {
    NSLog(@"定位按钮按下");
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
    }
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) { // 如果系统设备>=8.0 请求应用授权
        [self.locationManager requestWhenInUseAuthorization];
    } else {
        [self.locationManager startUpdatingHeading]; // 开始定位
    }
    
}

#pragma mark - KMapViewDelegage implements methods

- (MKAnnotationView * _Nullable)mapView:(MKMapView * _Nonnull)mapView viewForAnnotation:(id<MKAnnotation> _Nonnull)annotation {
    NSLog(@"mapView:viewForAnnotation");
    if (![[annotation class] isSubclassOfClass:[Annotation class]]) {
        return nil;
    }
    // Annotation *_annotation = (Annotation *)annotation;
    Annotation *_annotation = (id<MKAnnotation>)((Annotation *)annotation);
    static NSString *kReuseIdentifier = @"_annotation";
    
    
    MKPinAnnotationView *pinAnnotationView =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kReuseIdentifier];
    if (pinAnnotationView == nil) {
        pinAnnotationView = [[MKPinAnnotationView alloc]initWithAnnotation:_annotation
                                                           reuseIdentifier:kReuseIdentifier];
        pinAnnotationView.animatesDrop = YES;
        pinAnnotationView.canShowCallout = YES;
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, 30, 30);
        leftButton.backgroundColor = [UIColor redColor];
        pinAnnotationView.leftCalloutAccessoryView = leftButton;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotationView.rightCalloutAccessoryView = rightButton;
    }
    
    if (_annotation.index == 0) {
        // iOS9用以下来替换
        // pinAnnotationView.pinTintColor = MKPinAnnotationColorGreen;
        pinAnnotationView.pinColor = MKPinAnnotationColorGreen;
        // pinAnnotationView.leftCalloutAccessoryView.tag = 0;
    } else if (_annotation.index == 1) {
        pinAnnotationView.pinColor = MKPinAnnotationColorPurple;
    } else if (_annotation.index == 2) {
        pinAnnotationView.pinColor = MKPinAnnotationColorRed;
    }
    
    pinAnnotationView.tag = _annotation.index;
    
    pinAnnotationView.image = [UIImage imageNamed:@"blueButton.png"];
    
    
    return pinAnnotationView;
}

- (void)mapView:(nonnull MKMapView *)mapView didSelectAnnotationView:(nonnull MKAnnotationView *)view {
    NSLog(@"mapView:didSelectAnnotationView");
}

#pragma mark - CLLocationmanagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"等待用户授权");
    } else if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    } else {
        NSLog(@"授权失败");
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
    [self.locationManager stopUpdatingLocation];
    NSLog(@"%@", error.description);
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(nonnull CLLocation *)newLocation
           fromLocation:(nonnull CLLocation *)oldLocation {
    [self.locationManager stopUpdatingLocation];
    
    self.currentLocation = newLocation;
    _locationLabel.text = [NSString stringWithFormat:@"(%f,%f)", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
