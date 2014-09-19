//
//  ZCReGeocodeAnnotation.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-13.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapCommonObj.h>

@interface ZCReGeocodeAnnotation : NSObject

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate reGeocode:(AMapReGeocode *)reGeocode;

@property (nonatomic, readonly, strong) AMapReGeocode *reGeocode;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


/*!
 @brief 获取annotation标题
 @return 返回annotation的标题信息
 */
- (NSString *)title;

@end
