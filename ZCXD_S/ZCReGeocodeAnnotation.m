//
//  ZCReGeocodeAnnotation.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-13.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCReGeocodeAnnotation.h"

@interface ZCReGeocodeAnnotation ()

@property (nonatomic, readwrite, strong) AMapReGeocode *reGeocode;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;


@end

@implementation ZCReGeocodeAnnotation

#pragma mark - MAAnnotation Protocol

- (NSString *)title
{
    /* 包含 省, 市, 区以及乡镇.  */
    return [NSString stringWithFormat:@"%@%@%@%@",
            self.reGeocode.addressComponent.province,
            self.reGeocode.addressComponent.city,
            self.reGeocode.addressComponent.district,
            self.reGeocode.addressComponent.township];
    
}



#pragma mark - Life Cycle

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate reGeocode:(AMapReGeocode *)reGeocode
{
    if (self = [super init])
    {
        self.coordinate = coordinate;
        self.reGeocode  = reGeocode;
        
    }
    
    return self;
}

@end
