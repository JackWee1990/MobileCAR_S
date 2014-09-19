//
//  ZCViewController_WLXQ.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-15.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import "HttpController.h"
#import "ZCReGeocodeAnnotation.h"

@interface ZCViewController_WLXQ : UIViewController<MAMapViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic,strong) NSString *or_id;
@property (nonatomic,strong) NSDictionary *orderInfoDic;//存放Get回来的订单数据
@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) NSDictionary *addressInfoDic;//map datasource
@property (nonatomic,strong) NSArray *locationInfoArr;//tv datasource

- (void)maMapConfig;//初始化MAMapView *mapView;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;
- (void)getData;
- (void)tvConfig;//设置delegte frame

@end
