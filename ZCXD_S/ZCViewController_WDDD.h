//
//  ZCViewController_WDDD.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCTableViewCell_WDDD.h"
#import "ZCViewController_DDXQ.h"
#import "HttpController.h"

@interface ZCViewController_WDDD : UIViewController<UITableViewDataSource,UITabBarDelegate,UISearchBarDelegate, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITableView *tv;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barbutton_qb;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barbutton_ybj;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barbutton_jxz;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barbutton_ywc;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barbutton_ygb;

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic) BOOL currentDevis3_5Inch;//判断是否为3.5inch
@property (nonatomic,strong) NSMutableArray *orderInfoArray;//存放Get回来的订单数据
@property (nonatomic,strong) NSArray *staticOrderInfoArray;//存放Get回来的订单数据,不可修改
@property (nonatomic,strong) NSString *clt_mail;//从zcvc传递过来的clt_mail,根据其Get数据

@property (nonatomic) int tag_source;//根目录——1  司机详情——2

@property (nonatomic,strong) NSString *dr_tel;

//自定义UIBarButtonItem customView并赋予target
- (void)barButtonItemConfig;
- (void)barbuttonQBConfig;
- (void)barbuttonYBJConfig;
- (void)barbuttonJXZConfig;
- (void)barbuttonYWCConfig;
- (void)barbuttonYGBConfig;

- (void)barbutton_Click:(id)sender;

- (void)tableViewConfig;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;
- (void)getOrderData;
- (BOOL)is3_5Inch;
- (NSMutableArray*)loadOrderInfoArraywithTag:(NSInteger)tag;//根据tag返回orderInfoArray
@end
