//
//  ZCViewController_WLXQ.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-15.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_WLXQ.h"

@interface ZCViewController_WLXQ ()

@end

@implementation ZCViewController_WLXQ

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self getData];
    [self tvConfig];
    [self maMapConfig];
    [self navConfig];
    
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
    
    CGRect rect = [[UIScreen mainScreen]bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, height/2, 320, height/2)];
    self.mapView.delegate = self;
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.mapView];
    
    
    _mapView.showsUserLocation =YES; //设置为可以显示用户位置
    //_mapView.compassOrigin = CGPointMake(10, 440);
    _mapView.showsCompass = YES;//显示罗盘
    _mapView.showsScale = YES;
    _mapView.compassOrigin = CGPointMake(10, 430-80);
    _mapView.scaleOrigin = CGPointMake(180, 430-80);
    

        
        @try {
            NSString *la = [self.addressInfoDic objectForKey:@"lo_latitude"];
            NSString *lo = [self.addressInfoDic objectForKey:@"lo_longitude"];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(la.doubleValue,lo.doubleValue);
            ZCReGeocodeAnnotation *reGeocodeAnnotation = [[ZCReGeocodeAnnotation alloc] initWithCoordinate:coordinate
                                                                                                 reGeocode:nil];
            [self.mapView addAnnotation:reGeocodeAnnotation];
            
            
            MAAnnotationView *av_start = [self.mapView viewForAnnotation:reGeocodeAnnotation];
            
            
            NSString *path = [[NSBundle mainBundle] pathForResource:@"image_root_xiaoche_red" ofType:@"png"];
            av_start.image = [UIImage imageWithContentsOfFile:path];
            
            MACoordinateRegion viewRegion =MACoordinateRegionMake(coordinate, MACoordinateSpanMake(0.05,0.05));
            [_mapView setRegion:viewRegion];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
            
        }
        @finally {
            
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
    [customLab setText:@"物流信息"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)getData{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    
    NSString *url = [NSString stringWithFormat:@"app/clt_location_detail/?or_id=%@",self.or_id];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    _orderInfoDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",_orderInfoDic);
    
    self.addressInfoDic = [self.orderInfoDic objectForKey:@"address"];
    self.locationInfoArr = [self.orderInfoDic objectForKey:@"locations"];
    
    NSLog(@"addressInfoDic:%@",self.addressInfoDic);
    NSLog(@"locationInfoArr:%@",self.locationInfoArr);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    @try {
        return self.locationInfoArr.count;
    }
    @catch (NSException *exception) {
        return 0;
    }
    @finally {
        
    }
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    

        NSDictionary *cellDic = [self.locationInfoArr objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [cellDic objectForKey:@"lo_location"];
        
        
        cell.detailTextLabel.text = [cellDic objectForKey:@"lo_update"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
   
    return cell;
}

- (void)tvConfig{
    
    CGRect rect = [[UIScreen mainScreen]bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    self.tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, height/2)];
    self.tv.dataSource = self;
    self.tv.delegate = self;
    self.tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tv];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
@end
