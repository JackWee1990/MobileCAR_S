//
//  ZCViewController_BJLB.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCTableViewCell_BJLB.h"
#import "HttpController.h"
#import "ZCViewController_BJXQ.h"
@interface ZCViewController_BJLB : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tv;
@property (nonatomic,assign) NSString *currentOrderID;
@property (nonatomic,strong) NSArray *infoArr;//存放Get回来的数据


- (void)getData;
- (void)tvConfig;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;

@end
