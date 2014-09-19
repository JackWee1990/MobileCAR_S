//
//  ZCViewController_ZC_GRXX.h
//  ZCXD
//
//  Created by JackWee on 14-8-8.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_DL.h"

@interface ZCViewController_ZC_GRXX : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *text_xm;
@property (strong, nonatomic) IBOutlet UITextField *text_sjhm;
@property (strong, nonatomic) IBOutlet UITextField *text_sfz;
@property (strong, nonatomic) IBOutlet UITextField *text_mm;
@property (strong, nonatomic) IBOutlet UITextField *text_qrmm;
@property (strong, nonatomic) IBOutlet UIButton *button_next;
//@property (strong,nonatomic) ZCUserInfo *userInfo;
@property (strong, nonatomic) IBOutlet UITextField *text_gsmc;
@property (strong, nonatomic) IBOutlet UITextField *text_zw;
@property (strong, nonatomic) IBOutlet UITextField *text_hy;
@property (strong, nonatomic) IBOutlet UITextField *text_fwtj;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap_space;
@property (strong, nonatomic) IBOutlet UIScrollView *scView;

@property (nonatomic,strong) NSArray *arr_job;
@property (nonatomic,strong) NSArray *arr_field;
@property (nonatomic,strong) NSArray *arr_access;
@property (strong, nonatomic) IBOutlet UIButton *button_job;
@property (strong, nonatomic) IBOutlet UIButton *button_field;
@property (strong, nonatomic) IBOutlet UIButton *button_access;
@property (nonatomic,assign) int tag_button;//当button_tv点击时改变其值
@property (nonatomic,strong) NSArray *arr_current;
@property (strong, nonatomic) IBOutlet UITableView *tv_Access;
@property (strong, nonatomic) IBOutlet UITableView *tv_Field;
@property (strong, nonatomic) IBOutlet UITableView *tv_Job;

@property (nonatomic,assign) int tag;//区分注册--1/修改--2


- (IBAction)button_next_Click:(id)sender;
- (void)titleViewConfig;
- (void)textNameConfig;
- (void)textPhoneNumConfig;
- (void)textIDConfig;
- (void)textPWDConfig;
- (void)textPWDRConfig;
- (IBAction)tap_space_Click:(id)sender;
- (void)scViewConfig;
- (void)textCompanyConfig;
- (void)textJobConfig;
- (void)textFieldConfig;
- (void)textAcessWayConfig;
- (void)arrConfig;
- (IBAction)button_job_Click:(id)sender;
- (IBAction)button_field_Click:(id)sender;
- (IBAction)button_access_Click:(id)sender;
- (void)tvConfig;
- (void)test;
- (void)buttonConfig;
- (void)regUserInfo;
- (void)UpdateUserInfo;
- (void)getData;
@end
