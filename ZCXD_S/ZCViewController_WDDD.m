//
//  ZCViewController_WDDD.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_WDDD.h"

@interface ZCViewController_WDDD ()

@end

@implementation ZCViewController_WDDD

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
    self.currentDevis3_5Inch = [self is3_5Inch];
    // Do any additional setup after loading the view.
    [self tableViewConfig];
    [self barButtonItemConfig];
    [self navConfig];
    
    
    if (self.tag_source == 2) {
        self.toolbar.hidden = YES;
        self.label.hidden = YES;
    }
    [self getOrderData];
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
#pragma mark - ToolBar
- (void)barButtonItemConfig{
    
    [self barbuttonQBConfig];
    [self barbuttonYBJConfig];
    [self barbuttonYGBConfig];
    [self barbuttonYWCConfig];
    [self barbuttonJXZConfig];
}

- (void)barbuttonQBConfig{
    UIButton *button_qb = [UIButton buttonWithType:UIButtonTypeSystem];
    //button_qb
    
    button_qb.selected = YES;
    [button_qb setTitle:@"全部" forState:UIControlStateNormal];
    [button_qb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_qb setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_qb setTintColor:[UIColor clearColor]];
    button_qb.tag = 0;
    //[button_qb setTintColor:[UIColor blackColor]];
    [button_qb setFrame:CGRectMake(0, 0, 64, 30)];
    [button_qb addTarget:self action:@selector(barbutton_Click:) forControlEvents:UIControlEventTouchUpInside];
    self.barbutton_qb.customView = button_qb;
}

- (void)barbuttonYBJConfig{
    UIButton *button_ybj = [UIButton buttonWithType:UIButtonTypeSystem];
    //button_qb
    [button_ybj setTitle:@"显示中" forState:UIControlStateNormal];
    [button_ybj setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_ybj setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_ybj setTintColor:[UIColor clearColor]];
    button_ybj.tag = 1;
    [button_ybj setFrame:CGRectMake(0, 0, 64, 30)];
    [button_ybj addTarget:self action:@selector(barbutton_Click:) forControlEvents:UIControlEventTouchUpInside];
    self.barbutton_ybj.customView = button_ybj;
}
- (void)barbuttonJXZConfig{
    UIButton *button_jxz = [UIButton buttonWithType:UIButtonTypeSystem];
    //button_qb
    [button_jxz setTitle:@"进行中" forState:UIControlStateNormal];
    [button_jxz setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_jxz setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_jxz setTintColor:[UIColor clearColor]];
    button_jxz.tag = 2;
    [button_jxz setFrame:CGRectMake(0, 0, 64, 30)];
    [button_jxz addTarget:self action:@selector(barbutton_Click:) forControlEvents:UIControlEventTouchUpInside];
    self.barbutton_jxz.customView = button_jxz;
}
- (void)barbuttonYWCConfig{
    UIButton *button_ywc = [UIButton buttonWithType:UIButtonTypeSystem];
    //button_qb
    [button_ywc setTitle:@"已完成" forState:UIControlStateNormal];
    [button_ywc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_ywc setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_ywc setTintColor:[UIColor clearColor]];
    button_ywc.tag = 3;
    [button_ywc setFrame:CGRectMake(0, 0, 64, 30)];
    [button_ywc addTarget:self action:@selector(barbutton_Click:) forControlEvents:UIControlEventTouchUpInside];
    self.barbutton_ywc.customView = button_ywc;
}
- (void)barbuttonYGBConfig{
    UIButton *button_ygb = [UIButton buttonWithType:UIButtonTypeSystem];
    //button_qb
    [button_ygb setTitle:@"已关闭" forState:UIControlStateNormal];
    [button_ygb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_ygb setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_ygb setTintColor:[UIColor clearColor]];
    button_ygb.tag = 4;
    [button_ygb setFrame:CGRectMake(0, 0, 64, 30)];
    [button_ygb addTarget:self action:@selector(barbutton_Click:) forControlEvents:UIControlEventTouchUpInside];
    self.barbutton_ygb.customView = button_ygb;
}

- (void)barbutton_Click:(id)sender{
    UIButton *button = (UIButton *)sender;
    //[self barButtonItemConfig];
    //使未被选中的Button title 颜色为黑
    UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
    for (int i = 0; i < 5; i++) {
        item = self.toolbar.items[i];
        UIButton *btton = item.customView;
        btton.selected = NO;
    }
    //button.selected = NO;
    
    switch (button.tag) {//点击时label移动,tv reload:刷新orderInfoArray内容
        case 0:
            //NSLog(@"000000");
            if (self.currentDevis3_5Inch == 1) {
                //self.toolbar.bounds = CGRectMake(0, 200, 320, 44);
                self.label.frame = CGRectMake(17, 435, 50, 2);
            } else {
                self.label.frame = CGRectMake(17, 523, 50, 2);
            }
            //self.label.frame = CGRectMake(17, 523, 50, 2);
            button.selected = YES;
            break;
        case 1:
            //NSLog(@"1000000");
            if (self.currentDevis3_5Inch == 1) {
                //self.toolbar.bounds = CGRectMake(0, 200, 320, 44);
                self.label.frame = CGRectMake(17+58, 435, 50, 2);
            } else {
                self.label.frame = CGRectMake(17+58, 523, 50, 2);
            }
            //self.label.frame = CGRectMake(17+58, 523, 50, 2);
            button.selected = YES;
            break;
        case 2:
            //NSLog(@"2000000");
            if (self.currentDevis3_5Inch == 1) {
                //self.toolbar.bounds = CGRectMake(0, 200, 320, 44);
                self.label.frame = CGRectMake(17+58+58+2, 435, 50, 2);
            } else {
                self.label.frame = CGRectMake(17+58+58+2, 523, 50, 2);
            }
            //self.label.frame = CGRectMake(17+58+58+2, 523, 50, 2);
            button.selected = YES;
            break;
        case 3:
            //NSLog(@"3000000");
            if (self.currentDevis3_5Inch == 1) {
                //self.toolbar.bounds = CGRectMake(0, 200, 320, 44);
                self.label.frame = CGRectMake(17+58+58+58+4, 435, 50, 2);
            } else {
                self.label.frame = CGRectMake(17+58+58+58+4, 523, 50, 2);
            }
            //self.label.frame = CGRectMake(17+58+58+58+4, 523, 50, 2);
            button.selected = YES;
            break;
        case 4:
            //NSLog(@"4000000");
            if (self.currentDevis3_5Inch == 1) {
                //self.toolbar.bounds = CGRectMake(0, 200, 320, 44);
                self.label.frame = CGRectMake(17+58+58+58+58+6, 435, 50, 2);
            } else {
                self.label.frame = CGRectMake(17+58+58+58+58+6, 523, 50, 2);
            }
            //self.label.frame = CGRectMake(17+58+58+58+58+6, 523, 50, 2);
            button.selected = YES;
            break;
        default:
            break;
    }
    //UIButton *button = (UIButton *)sender;
    ////////////////////////
    _orderInfoArray = [self loadOrderInfoArraywithTag:(button.tag - 1)];
    //////
    [self.tv reloadData];
    //button.selected = !button.selected;
}
#pragma mark - TableView
- (void)tableViewConfig {
    if (self.tag_source == 2) {
        self.tv.frame = CGRectMake(0, 0, 320, 600);
    }
    
    
    UINib *nib = [UINib nibWithNibName:@"ZCTableViewCell_WDDD" bundle:nil];
    [self.tv registerNib:nib forCellReuseIdentifier:@"ZCTableViewCell_WDDD"];
    //self.tv.delegate = self;
    self.tv.delegate = self;
    self.tv.dataSource = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.orderInfoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCTableViewCell_WDDD *cell = [self.tv dequeueReusableCellWithIdentifier:@"ZCTableViewCell_WDDD" ];
    
    NSDictionary *currentRowinfo = self.orderInfoArray[indexPath.row];//存放当前row数据信息
    
    cell.label_cpy.text = [currentRowinfo objectForKey:@"or_title"];//@"黑龙江私营工厂寻找货物物流合作";
    cell.label_cpy.textColor = [UIColor redColor];
    //cell.label_cpy.adjustsFontSizeToFitWidth = YES;
    cell.label_source.text = [currentRowinfo objectForKey:@"or_start"];//@"黑龙江省哈尔滨市南岗区 革新街321-3号";
    //cell.label_source.adjustsFontSizeToFitWidth = YES;
    cell.label_dst.text = [currentRowinfo objectForKey:@"or_end"];//@"吉林省长春市上领区 鼎新三道街218号";
    //cell.label_dst.adjustsFontSizeToFitWidth = YES;
    //NSNumber *cid = [currentRowinfo objectForKey:@"or_id"];
    //self.currentOrderID = cid.intValue;
    NSNumber *numofOffer = [currentRowinfo objectForKey:@"offer_nums"];//当前报价数量
    NSString *buttonTitle = [NSString stringWithFormat:@"报价详情(%@)",numofOffer ];
    [cell.button_numofOrder setTitle:buttonTitle forState:UIControlStateNormal];
    
    NSNumber *or_status = [currentRowinfo objectForKey:@"or_status"];//当前订单状态
    int orderStatus = or_status.intValue;
    NSString *imageName = nil;
    //NSString *label_status_text = nil;
    //UIColor *label_status_bgc = nil;
    switch (orderStatus) {
        case 0:
            imageName = @"orderready2.png";
            //label_status_text = @"已报价";
            //label_status_bgc = [UIColor blueColor];
            break;
        case 1:
            imageName = @"jxz.png";
            //label_status_text = @"进行中";
            //label_status_bgc = [UIColor greenColor];
            break;
        case 2:
            imageName = @"ywc.png";
            //label_status_text = @"已完成";
            //label_status_bgc = [UIColor orangeColor];
            break;
        case 3:
            imageName = @"ygb.png";
            //label_status_text = @"已关闭";
            //label_status_bgc = [UIColor grayColor];
            break;
        default:
            break;
    }
    //cell.label_status.text = label_status_text;
    
    //cell.label_status.textColor = [UIColor whiteColor];
    //cell.label_status.backgroundColor = label_status_bgc;
    cell.iv_zt.image = [UIImage imageNamed:imageName];
    //cell.label_cpy.font = [UIFont systemFontOfSize:14];
    //cell.label_source.font = [UIFont systemFontOfSize:14];
    //cell.label_dst.font = [UIFont systemFontOfSize:14];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //NSLog(@"1");
    return cell;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"WDDD_didSelectRowAtIndexPath");
    ZCViewController_DDXQ *vc = [[ZCViewController_DDXQ alloc]initWithNibName:@"ZCViewController_DDXQ" bundle:nil];
    
    
    NSDictionary *currentRowinfo = self.orderInfoArray[indexPath.row];//存放当前row数据信息
    NSNumber *status = [currentRowinfo objectForKey:@"or_status"];
    NSString *or_status = status.stringValue;
    
    NSString *cid = [currentRowinfo objectForKey:@"or_id"];
    vc.currentOrderID = cid;
    //vc.currentOrderID = self.currentOrderID;
    vc.dr_tel = self.dr_tel;
    vc.or_status = or_status;
    [self.navigationController pushViewController:vc animated:true];
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
    [customLab setText:@"我的订单"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)getOrderData{
    //NSLog(@"ZCViewController_WDDD_getOrderData");
    //GET 我的订单
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";

    NSString *url = [NSString stringWithFormat:@"app/clt_order/?clt_mail=%@",self.clt_mail];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    _orderInfoArray = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    _staticOrderInfoArray = _orderInfoArray;
    
    if (self.tag_source == 2) {
        
        _orderInfoArray = [self loadOrderInfoArraywithTag:0];
        NSLog(@"tag_source == 2");
    }
    
    [self.tv reloadData];
    NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",resultString);
    //NSLog(@"我的订单数量：%lu",(unsigned long)self.orderInfoArray.count);
    /*
    if ([self someOrderisOnGoing]) {
        [self sendCurrentPoistiontoServer];
    }
     */
}
- (BOOL)is3_5Inch{
    CGFloat height = [[UIScreen mainScreen]bounds].size.height;
    if (height == 480) {
        return true;
    }
    return false;
}

- (NSMutableArray*)loadOrderInfoArraywithTag:(NSInteger)tag{
    
    /*
     1.解析staticOrderInfoArray
     2.判断orderStatus——int
     3.将符合tag的元素置入resultArray中
     */
    //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_tag=%ld\n",(long)tag);
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    if (tag == -1) {
        [resultArray addObjectsFromArray:_staticOrderInfoArray];
    } else {
        for (int i = 0; i < _staticOrderInfoArray.count; i++) {
            NSDictionary *dataDic = _staticOrderInfoArray[i];
            NSString *tagString = [NSString stringWithFormat:@"%ld",(long)tag];
            //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_or_status=%@\n",[dataDic objectForKey:@"or_status"]);
            //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_tagString=%@\n",tagString);
            NSNumber *orderStatus = [dataDic objectForKey:@"or_status"];
            int or_Status = orderStatus.intValue;
            
            if (or_Status == tag) {
                //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_beforeAddobject");
                [resultArray addObject:dataDic];
                //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_afterAddobject");
            }
            /*
             if ([[dataDic objectForKey:@"or_status"] isEqualToString:tagString]) {
             NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_beforeAddobject");
             [resultArray addObject:dataDic];
             NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_afterAddobject");
             }*/
        }
    }
    
    //NSLog(@"ZCViewController_WDDD_roadOrderInfoArraywithTag_resultArray.count=%lu\n",(unsigned long)resultArray.count);
    //NSMutableArray *resultArray;
    return resultArray;
}
@end
