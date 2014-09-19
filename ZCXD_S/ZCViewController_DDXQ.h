//
//  ZCViewController_DDXQ.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_BJLB.h"
#import "ZCViewController_WLXQ.h"
#import "ZCViewController.h"
#import "ZCViewController_PJ.h"
@interface ZCViewController_DDXQ : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *text_introduce;
@property (strong, nonatomic) IBOutlet UITextField *text_zcdd;
@property (strong, nonatomic) IBOutlet UITextField *text_xcdd;
@property (strong, nonatomic) IBOutlet UITextField *text_dhsj;
@property (strong, nonatomic) IBOutlet UITextField *text_ddsj;
@property (strong, nonatomic) IBOutlet UITextField *text_hpmc;
@property (strong, nonatomic) IBOutlet UITextField *text_hb;
@property (strong, nonatomic) IBOutlet UITextField *text_sl;
@property (strong, nonatomic) IBOutlet UITextField *text_zzl;
@property (strong, nonatomic) IBOutlet UILabel *label_info;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *button_OrderUpdate;
@property (strong, nonatomic) IBOutlet UIButton *button_CheckInfo;
@property (strong, nonatomic) IBOutlet UIButton *button_ckwl;
@property (nonatomic,assign) NSString *currentOrderID;
@property (nonatomic,strong) NSDictionary *infoDic;//存放Get回来的数据

@property (nonatomic,strong) NSString *dr_tel;

@property (nonatomic,strong) NSString *or_status;//区分显示中/进行中/已完成/已关闭
@property (strong, nonatomic) IBOutlet UITextField *text_pj;



- (IBAction)button_OrderUpdate_Click:(id)sender;
- (IBAction)button_CheckInfo_Click:(id)sender;
- (IBAction)button_ckwl_Click:(id)sender;
- (void)scrollViewConfig;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;
- (void)getData;

- (void)textInfoConfig;
- (void)textIntroduceConfig;
- (void)textZCDDConfig;
- (void)textXCDDConfig;
- (void)textDHSJConfig;
- (void)textDDSJConfig;
- (void)textHPMCConfig;
- (void)textHBConfig;
- (void)textSLConfig;
- (void)textZZLConfig;
- (void)buttonConfig;
@end
