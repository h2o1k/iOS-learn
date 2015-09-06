//
//  Annotation.m
//  lesson02
//
//  Created by snddfhv on 15/8/8.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (Annotation *)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                     title:(NSString *)title
                  subtitle:(NSString *)subtitle
                     index:(NSInteger)index {
    self.coordinate = coordinate;
    self.title = title;
    self.subtitle = subtitle;
    self.index = index;
    
    return self;
}

@end
