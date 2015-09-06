//
//  Annotation.h
//  lesson02
//
//  Created by snddfhv on 15/8/8.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "BaseViewController.h"
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>

@property(nonatomic, assign)CLLocationCoordinate2D coordinate;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *subtitle;
@property(nonatomic, assign)NSInteger index;

- (Annotation *)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                     title:(NSString *)title
                  subtitle:(NSString *)subtitle
                     index:(NSInteger)index;


@end
