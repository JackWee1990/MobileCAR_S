//
//  ZCViewController_Root.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-13.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import <MAMapKit/MAMapKit.h>
#import "ZCReGeocodeAnnotation.h"
#import "ZCViewController_WDDD.h"
#import "ZCViewController.h"
@interface ZCViewController_Root : UIViewController
<UITableViewDelegate,UITableViewDataSource,MAMapViewDelegate,CLLocationManagerDelegate,AMapSearchDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManger;
@property (nonatomic,strong) AMapSearchAPI *search;
@property (nonatomic,strong) UILongPressGestureRecognizer *ges_longpress;
@property (nonatomic,assign) int infoView_status;
@property (nonatomic,strong) UIView *infoView;
@property (nonatomic,strong) UIButton *button_set;
@property (nonatomic,strong) UIButton *button_reset;

//各种参数
@property (nonatomic,strong) NSString *textField_bt;
@property (nonatomic,strong) NSString *textField_bj;
@property (nonatomic,strong) NSString *textField_hpmc;
@property (nonatomic,strong) NSString *textField_zjz;
@property (nonatomic,strong) NSString *textField_ydshb;
@property (nonatomic,strong) NSString *textField_ydssl;
@property (nonatomic,strong) NSString *textField_zzlwds;
@property (nonatomic,strong) NSString *textField_cc;
@property (nonatomic,strong) NSString *textField_cck;
@property (nonatomic,strong) NSString *textField_ccg;
@property (nonatomic,strong) NSString *textField_ztj;
@property (nonatomic,strong) NSString *textField_nxynzhc;
@property (nonatomic,strong) NSString *textField_nxydclcd;
@property (nonatomic,strong) NSString *textField_sfxysjxz;
@property (nonatomic,strong) NSString *textView_xqsm;
@property (nonatomic,strong) NSString *sc_wxp;
@property (nonatomic,strong) NSString *sc_kdf;
@property (nonatomic,strong) NSString *sc_zf;
@property (nonatomic,strong) NSString *sc_bx;
@property (nonatomic,strong) NSString *time_thsj;
@property (nonatomic,strong) NSString *time_ddsj;

@property (nonatomic,strong) NSString *startAdress;//出发点
@property (nonatomic,strong) NSString *endAdress;//收货点
//出发位置经纬度
@property (nonatomic,strong) NSString *startlo;
@property (nonatomic,strong) NSString *startla;


- (void)maMapConfig;//初始化MAMapView *mapView;
- (void)locationMangerConfig;//初始化CLLocationManager *locationManger;
- (void)mapSearchConfig;//初始化AMapSearchAPI *search
- (void)searchReGeocodeWithLongitude:(CLLocationDegrees)_longitude_ latitude:(CLLocationDegrees)_latitude_ ;//地理位置逆向查询
- (void)gesConfig;//初始化ges
- (void)ges_longpress_Action:(UILongPressGestureRecognizer *)longPress;
- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)addInfoView:(ZCReGeocodeAnnotation*)rgAnnitation;
- (void)createSetButton:(ZCReGeocodeAnnotation*)rgAnnitation;
- (void)createRetSetButton:(ZCReGeocodeAnnotation*)rgAnnitation;
- (void)button_set_Click;//设定
- (void)button_reset_Click;//重置
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;

- (void)test;
- (void)sendDatatoServer;
@end
