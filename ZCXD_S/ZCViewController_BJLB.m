//
//  ZCViewController_BJLB.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_BJLB.h"

@interface ZCViewController_BJLB ()

@end

@implementation ZCViewController_BJLB

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
    // Do any additional setup after loading the view from its nib.
    [self tvConfig];
    [self navConfig];
    [self getData];
    NSLog(@"BJLB_oid=%@",self.currentOrderID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tvConfig{
    UINib *nib = [UINib nibWithNibName:@"ZCTableViewCell_BJLB" bundle:nil];
    [self.tv registerNib:nib forCellReuseIdentifier:@"ZCTableViewCell_BJLB"];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCTableViewCell_BJLB *cell = [self.tv dequeueReusableCellWithIdentifier:@"ZCTableViewCell_BJLB" ];
    NSDictionary *infoDic = [_infoArr objectAtIndex:indexPath.row];
    //NSLog(@"BJLB_cellForRowAtIndexPath_info=%@",infoDic);
    
    NSNumber *oid = [infoDic objectForKey:@"dr_iden"];
    NSNumber *tel = [infoDic objectForKey:@"dr_tel"];
    NSNumber *price = [infoDic objectForKey:@"of_price"];
    NSString *str_oid = [NSString stringWithFormat:@"%@",oid];
    
    cell.label_name.text = [infoDic objectForKey:@"dr_name"];
    cell.label_price.text = price.stringValue;
    cell.label_id.text = str_oid;
    cell.label_tel.text = [infoDic objectForKey:@"dr_tel"];
    cell.label_type.text = [infoDic objectForKey:@"dr_type"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
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
    [customLab setText:@"报价列表"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)getData{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    //NSString *url = @"http://115.28.107.151:8082/t/app/order/?longitude=125&latitude=45";
    NSString *url = [NSString stringWithFormat:@"app/clt_receive/?or_id=%@",self.currentOrderID];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_BJLB_getData%@",resultString);
    _infoArr  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCViewController_BJXQ *vc = [[ZCViewController_BJXQ alloc]initWithNibName:@"ZCViewController_BJXQ" bundle:nil];
    
    
    NSDictionary *currentRowinfo = self.infoArr[indexPath.row];//存放当前row数据信息
    
    NSString *cid = [currentRowinfo objectForKey:@"of_id"];
    vc.of_id = cid;
    //vc.currentOrderID = self.currentOrderID;
    
    [self.navigationController pushViewController:vc animated:true];
    
    
}
@end
