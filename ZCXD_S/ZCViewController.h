//
//  ZCViewController.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-9.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_WDDD.h"
#import "ZCUIView_Menu.h"
#import "ZCViewController_SZ.h"
#import "ZCViewController_ZC_GRXX.h"
#import "ZCViewController_DL.h"
#import "HttpController.h"
#import "ZCViewController_SJXQ.h"

@interface ZCViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *label_news;



@property (strong, nonatomic) IBOutlet UIButton *button_submit;
@property (strong, nonatomic) IBOutlet UIButton *button_orderList;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap_menu;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap_On_imagelogo_and_labelName;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *tap_menu_left;


@property (strong, nonatomic) NSArray *arr;//tableview label 数组
@property (strong, nonatomic) NSArray *arr_logo;//tableview logo 数组
@property (strong, nonatomic) ZCUIView_Menu *menu;
@property (nonatomic) BOOL isLogin;//判断是否登录
@property (strong,nonatomic) NSArray *commendArr;

@property (strong, nonatomic) IBOutlet UIButton *button_c1;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c1;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c1;

@property (strong, nonatomic) IBOutlet UIButton *button_c2;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c2;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c2;

@property (strong, nonatomic) IBOutlet UIButton *button_c3;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c3;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c3;

@property (strong, nonatomic) IBOutlet UIButton *button_c4;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c4;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c4;

@property (strong, nonatomic) IBOutlet UIButton *button_c5;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c5;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c5;

@property (strong, nonatomic) IBOutlet UIButton *button_c6;
@property (strong, nonatomic) IBOutlet UILabel *label_name_c6;
@property (strong, nonatomic) IBOutlet UILabel *label_score_c6;

- (IBAction)button_c1_Click:(id)sender;
- (IBAction)button_c2_Click:(id)sender;
- (IBAction)button_c3_Click:(id)sender;
- (IBAction)button_c4_Click:(id)sender;
- (IBAction)button_c5_Click:(id)sender;
- (IBAction)button_c6_Click:(id)sender;






- (IBAction)button_submit_Click:(id)sender;
- (IBAction)button_orderList_Click:(id)sender;
- (IBAction)tap_On_menu:(id)sender;
- (IBAction)tap_On_imagelogo_and_labelName_Click:(id)sender;
- (IBAction)tap_On_menu_left:(id)sender;





- (void)setNavBarItemWhite;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;
- (void)baseArrConfig;
- (void)addZCUIView_Menu;
- (void)tapConfig;
- (void)menuClear;//移出menu
- (void)getDataFromUserDefault;
- (void)getCommendArr;
- (void)drConfig;
- (void)dr1Config;
- (void)dr2Config;
- (void)dr3Config;
- (void)dr4Config;
- (void)dr5Config;
- (void)dr6Config;
- (void)pushViewControllerDL;
@end
