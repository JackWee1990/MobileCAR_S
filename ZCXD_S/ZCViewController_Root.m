//
//  ZCViewController_Root.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-13.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_Root.h"
#import "HttpController.h"

@interface ZCViewController_Root ()

@end

@implementation ZCViewController_Root

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"ZCViewController_Root_viewDidLoad");
    self.infoView_status = 0;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self mapSearchConfig];
    [self locationMangerConfig];
    [self maMapConfig];
    [self gesConfig];
    [self navConfig];
    
    //[self test];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)maMapConfig{
    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    
    
    _mapView.showsUserLocation =YES; //设置为可以显示用户位置
    //_mapView.compassOrigin = CGPointMake(10, 440);
    _mapView.showsCompass = YES;//显示罗盘
    _mapView.showsScale = YES;
    _mapView.compassOrigin = CGPointMake(10, 430-80);
    _mapView.scaleOrigin = CGPointMake(180, 430-80);
    
}

- (void)locationMangerConfig{
    self.locationManger = [[CLLocationManager alloc]init];
    self.locationManger.delegate = self;
    
    //[self.locationManger requestAlwaysAuthorization];//ios8
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self.locationManger requestAlwaysAuthorization];//ios8
    }
    self.locationManger.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManger.distanceFilter = kCLDistanceFilterNone;
    [self.locationManger startUpdatingLocation];
}

- (void)mapSearchConfig{
    self.search = [[AMapSearchAPI alloc]initWithSearchKey:[MAMapServices sharedServices].apiKey Delegate:self];
}

- (void)searchReGeocodeWithLongitude:(CLLocationDegrees)_longitude_ latitude:(CLLocationDegrees)_latitude_ {

    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
    regeoRequest.searchType = AMapSearchType_ReGeocode;
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:_latitude_ longitude:_longitude_];
    //regeoRequest.radius = 10000;
    //regeoRequest.requireExtension = NO;
    [self.search AMapReGoecodeSearch: regeoRequest];//onReGeocodeSearchDone
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response{
    
    if (response.regeocode != nil) {
        NSString *result = [NSString stringWithFormat:@"%@",response.regeocode.formattedAddress];
        NSLog(@"Root_onReGeocodeSearchDone: %@",result);
        //ReGeo: ReGeocode: {address: addressComponent: {province: city: district: township: neighborhood: building: citycode: adcode: streetNumber: {street: number: location: {0.000000 0.000000} distance: 0 direction: }} roads: [] roadinters: [] pois: []}
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(request.location.latitude, request.location.longitude);
        ZCReGeocodeAnnotation *reGeocodeAnnotation = [[ZCReGeocodeAnnotation alloc] initWithCoordinate:coordinate
                                                                                             reGeocode:response.regeocode];
        if (self.infoView_status < 2) {
            [self.infoView removeFromSuperview];
            NSArray *annotationsWillDel = [[NSArray alloc]init];
            if (self.infoView_status == 0) {
                annotationsWillDel = self.mapView.annotations;
                //[self.mapView removeAnnotations:annotationsWillDel];
            }
            else if(self.infoView_status == 1){
                
                if (self.mapView.annotations.count == 2) {
                    annotationsWillDel = [self.mapView.annotations subarrayWithRange:NSMakeRange(1, self.mapView.annotations.count - 1)];
                }
                
            }
            [self.mapView removeAnnotations:annotationsWillDel];
            [self.mapView addAnnotation:reGeocodeAnnotation];//地图上添加标注
            [self addInfoView:reGeocodeAnnotation];
            //NSLog(@"Root_indexOfObject=%lu",(unsigned long)[self.mapView.annotations indexOfObject:reGeocodeAnnotation]);
        }
        
    }

    
}

- (void)search:(id)searchRequest error:(NSString*)errInfo{
    NSLog(@"ZCViewController_Root_searchRequest_error%@",errInfo);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    
    CLLocationCoordinate2D coordinate; //设定经纬度
    coordinate.latitude =newLocation.coordinate.latitude; //纬度
    coordinate.longitude =newLocation.coordinate.longitude; //经度
    MACoordinateRegion viewRegion =MACoordinateRegionMake(coordinate, MACoordinateSpanMake(0.1,0.1));
    [_mapView setRegion:viewRegion];
    
    [self.locationManger stopUpdatingLocation];

}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"ZCViewController_Root_locationManager_error:\n%@",error);
    //[self.locationManger startUpdatingLocation];
    CLLocationCoordinate2D coordinate; //设定经纬度
    coordinate.latitude =45.75000; //纬度
    coordinate.longitude =126.63333; //经度
    MACoordinateRegion viewRegion =MACoordinateRegionMake(coordinate, MACoordinateSpanMake(0.1,0.1));
    [_mapView setRegion:viewRegion];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    return cell;
}

- (void)gesConfig{
    self.ges_longpress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(ges_longpress_Action:)];
    self.ges_longpress.minimumPressDuration = 0.5;
    [self.mapView addGestureRecognizer:self.ges_longpress];
}

- (void)ges_longpress_Action:(UILongPressGestureRecognizer *)longPress{
    //NSLog(@"Root_ges_longpress_Action");
    /*
     在地图上长按触发该函数，之后
     1.通过触发位置获取经纬度
     2.通过触发位置在地图上添加MAAnnotationView
     3.根据经纬度反向解析地址
     4.添加View——设置起终点
     */
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:[longPress locationInView:self.view]
                                                  toCoordinateFromView:self.mapView];
        
        [self searchReGeocodeWithCoordinate:coordinate];
    }
}

- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate{
    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
    regeoRequest.searchType = AMapSearchType_ReGeocode;
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    //regeoRequest.radius = 10000;
    //regeoRequest.requireExtension = NO;
    [self.search AMapReGoecodeSearch: regeoRequest];//onReGeocodeSearchDone
}

- (void)addInfoView:(ZCReGeocodeAnnotation*)rgAnnitation{
    self.infoView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-90, self.view.bounds.size.width, 90)];
    self.infoView.backgroundColor = [UIColor whiteColor];
    //增加地理位置Label
    UILabel *label_address = [[UILabel alloc]init];
    label_address.frame = CGRectMake(10, 10, 300, 40);
    label_address.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    label_address.text = rgAnnitation.reGeocode.formattedAddress;
    label_address.font = [UIFont systemFontOfSize:13];
    //[label_address sizeToFit];
    [self.infoView addSubview:label_address];
    
    //增加set button
    self.button_set = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 140, 30)];
    [self.button_set setBackgroundColor:[UIColor redColor]];
    self.button_set.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.button_set setTitle:@"设为起点" forState:UIControlStateNormal];
    //button_set.showsTouchWhenHighlighted = YES;//按下会发光
    [self.infoView addSubview:self.button_set];
    [self.button_set addTarget:self action:@selector(button_set_Click) forControlEvents:UIControlEventTouchUpInside];
    //增加reset button
    self.button_reset = [[UIButton alloc]initWithFrame:CGRectMake(170, 50, 140, 30)];
    [self.button_reset setBackgroundColor:[UIColor blueColor]];
    self.button_reset.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.button_reset setTitle:@"重置" forState:UIControlStateNormal];
    [self.button_reset addTarget:self action:@selector(button_reset_Click) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.button_reset];
    
    switch (self.infoView_status) {
        case 0:
            [self.button_set setTitle:@"设为起点" forState:UIControlStateNormal];
            [self.button_reset setTitle:@"重置起点" forState:UIControlStateNormal];
            break;
        case 1:
            [self.button_set setTitle:@"设为终点" forState:UIControlStateNormal];
            [self.button_reset setTitle:@"重置终点" forState:UIControlStateNormal];
            break;
        case 2:
            [self.button_set setTitle:@"发布订单" forState:UIControlStateNormal];
            [self.button_reset setTitle:@"重置订单" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    [self.mapView addSubview:self.infoView];
}

- (void)createSetButton:(ZCReGeocodeAnnotation*)rgAnnitation{
    
    
}

- (void)createRetSetButton:(ZCReGeocodeAnnotation*)rgAnnitation{
    
}

- (void)button_set_Click{
    
    
    self.infoView_status++;
    NSLog(@"Root_button_set_Click_infoView_status=%d",self.infoView_status);
    NSArray *annotationsWillDel = [[NSArray alloc]init];
    if (self.infoView_status == 1) {//用户点击"设为起点"
        /*当用户点击"设为起点"后
         1.改变最近添加的Annotation的图像icon_st
         2.移除之前添加的Annotation
         实现方法：
         1.遍历该MapView中所有Annotation
         2.修改最后一个Annotation的tag
         3.根据tag进行相应操作
         */
        ZCReGeocodeAnnotation *ra_st = [self.mapView.annotations lastObject];//获取start
        //ra_st.tag = 1;
        MAAnnotationView *av_start = [self.mapView viewForAnnotation:ra_st];
        av_start.image = [UIImage imageNamed:@"icon_st.png"];
        //
        self.startAdress = ra_st.reGeocode.formattedAddress;
        self.startla = [NSString stringWithFormat:@"%f",ra_st.coordinate.latitude ];
        self.startlo = [NSString stringWithFormat:@"%f",ra_st.coordinate.longitude ];
        //
        [self.infoView removeFromSuperview];
        annotationsWillDel = [self.mapView.annotations subarrayWithRange:NSMakeRange(0, self.mapView.annotations.count - 1)];
        [self.mapView removeAnnotations:annotationsWillDel];
    }
    else if (self.infoView_status == 2) {//用户点击"设为终点"
        
        ZCReGeocodeAnnotation *ra_end = [self.mapView.annotations lastObject];//获取start
        //ra_end.tag = 2;
        MAAnnotationView *av_end = [self.mapView viewForAnnotation:ra_end];
        av_end.image = [UIImage imageNamed:@"icon_en.png"];
        
        self.endAdress = ra_end.reGeocode.formattedAddress;
        
        annotationsWillDel = [self.mapView.annotations subarrayWithRange:NSMakeRange(1, self.mapView.annotations.count - 2)];
        [self.mapView removeAnnotations:annotationsWillDel];
        [self.button_set setTitle:@"发布订单" forState:UIControlStateNormal];
        [self.button_reset setTitle:@"重置订单" forState:UIControlStateNormal];
    }
    else if(self.infoView_status == 3){
        //ZCViewController_WDDD *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_WDDD"];
        //ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]init];
        //[self test];
        //NSLog(@"startAdress:%@",self.startAdress);
        [self sendDatatoServer];
        
        
        
        
    }
    else if(self.infoView_status == 4){
        self.infoView_status = -1;
        [self.infoView removeFromSuperview];
    }
    else{
        [self.infoView removeFromSuperview];
    }
}

- (void)navConfig{
    
    [self navTitleConfig];
    [self navItemConfig];
}

- (void)navItemConfig{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;
    
}

- (void)navTitleConfig{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"ZCXD"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)button_reset_Click{
    NSLog(@"Root_button_reset_Click_infoView_status=%d",self.infoView_status);
    NSArray *annotationsWillDel = [[NSArray alloc]init];
    if (self.infoView_status == 0) {//移除start以外的annotation
        self.infoView_status = 0;
        //annotationsWillDel = [self.mapView.annotations subarrayWithRange:NSMakeRange(0, self.mapView.annotations.count - 1)];
        annotationsWillDel = self.mapView.annotations;
    }
    else if(self.infoView_status == 1){//移除start&end以外的annotation
        //self.infoView_status--;
        annotationsWillDel = [self.mapView.annotations subarrayWithRange:NSMakeRange(1, self.mapView.annotations.count - 1)];
    }
    else if(self.infoView_status >= 2){//移除所有的annotation
        self.infoView_status = 0;
        annotationsWillDel = self.mapView.annotations;
        
    }
    else{
        annotationsWillDel = self.mapView.annotations;
    }

    [self.mapView removeAnnotations:annotationsWillDel];
    [self.infoView removeFromSuperview];
}

- (void)test{
    NSLog(@"Here is Root");
    /*
    NSLog(@"textField_bt:%@",self.textField_bt);
    NSLog(@"textField_bj:%@",self.textField_bj);
    NSLog(@"textField_thsj:%@",self.time_thsj);
    NSLog(@"textField_ddsj:%@",self.time_ddsj);
    NSLog(@"textField_hpmc:%@",self.textField_hpmc);
    NSLog(@"textField_zjz:%@",self.textField_zjz);
    NSLog(@"textField_ydshb:%@",self.textField_ydshb);
    NSLog(@"textField_ydssl:%@",self.textField_ydssl);
    NSLog(@"textField_zzlwds:%@",self.textField_zzlwds);
    NSLog(@"textField_cc:%@",self.textField_cc);
    NSLog(@"textField_cck:%@",self.textField_cck);
    NSLog(@"textField_ccg:%@",self.textField_ccg);
    NSLog(@"textField_ztj:%@",self.textField_ztj);
    NSLog(@"textField_nxynzhc:%@",self.textField_nxynzhc);
    NSLog(@"textField_nxydclcd:%@",self.textField_nxydclcd);
    NSLog(@"sc_wxp:%@",self.sc_wxp);
    NSLog(@"sc_kdf:%@",self.sc_kdf);
    NSLog(@"sc_zf:%@",self.sc_zf);
    NSLog(@"sc_bx:%@",self.sc_bx);
    NSLog(@"textField_sfxysjxz:%@",self.textField_sfxysjxz);
    NSLog(@"textView_xqsm:%@",self.textView_xqsm);
    NSLog(@"time_thsj:%@",self.time_thsj);
    NSLog(@"time_ddsj:%@",self.time_ddsj);
     */
    
    NSLog(@"startAdress:%@",self.startAdress);
    NSLog(@"startla:%@",self.startla);
    NSLog(@"startlo:%@",self.startlo);
    NSLog(@"endAdress:%@",self.endAdress);
}

- (void)sendDatatoServer{
    
    NSString *clt_mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_mail"];
    
    HttpController *httpCpntroller = [[HttpController alloc]init];
    NSString *type = @"POST";
    NSString *url = [NSString stringWithFormat:@"app/publish/"];
    NSString *tsbj = [self.textField_bj substringToIndex:0];
    
    NSLog(@"root_tsbj:%@",tsbj);
    
    
    
    NSString *info = [NSString stringWithFormat:@"clt_mail=%@&or_start=%@&or_end=%@&or_push=%@&or_startTime=%@&or_endTime=%@&or_title=%@&or_name=%@&or_price=%@&or_board=%@&or_number=%@&or_weight=%@&or_size_l=%@&or_size_w=%@&or_size_h=%@&or_volume=%@&or_truck=%@&or_length=%@&or_isDanger=%@&or_isHeap=%@&or_isHand=%@&or_isAssist=%@&or_isInsurance=%@&or_request=%@&or_longitude=%@&or_latitude=%@",clt_mail,self.startAdress,self.endAdress,self.textField_bj,self.time_thsj,self.time_ddsj,self.textField_bt,self.textField_hpmc,self.textField_zjz,self.textField_ydshb,self.textField_ydssl,self.textField_zzlwds,self.textField_cc,self.textField_cck,self.textField_ccg,self.textField_ztj,self.textField_nxynzhc,self.textField_nxydclcd,self.sc_wxp,self.sc_kdf,self.sc_zf,self.textField_sfxysjxz,self.sc_bx,self.textView_xqsm,self.startlo,self.startla];
    
    //[httpCpntroller httpHandleWithType:type url:url info:info];
    NSData *reponseData = [httpCpntroller httpHandleWithType:type url:url info:info];
    
    NSString *resultString = [[NSString alloc]initWithData:reponseData encoding:NSUTF8StringEncoding];
    NSLog(@"Root_%@",resultString);
    
    
    ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]initWithNibName:@"ZCViewController_WDDD" bundle:nil];
    vc.clt_mail = clt_mail;
    [self.navigationController pushViewController:vc animated:false];
}
@end
