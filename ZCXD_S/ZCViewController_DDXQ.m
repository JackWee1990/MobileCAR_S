//
//  ZCViewController_DDXQ.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-14.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_DDXQ.h"

@interface ZCViewController_DDXQ ()

@end

@implementation ZCViewController_DDXQ

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
    [self getData];
    [self scrollViewConfig];
    [self navConfig];
    
    [self textInfoConfig];
    [self textIntroduceConfig];
    
    [self textZCDDConfig];
    [self textXCDDConfig];
    [self textDHSJConfig];
    [self textDDSJConfig];
    [self textHPMCConfig];
    [self textHBConfig];
    [self textSLConfig];
    [self textZZLConfig];
    
    NSLog(@"DDXQ_oid=%@",self.currentOrderID);
    NSLog(@"DDXQ_dr_tel=%@",self.dr_tel);
    NSLog(@"DDXQ_or_status=%@",self.or_status);
    //self.button_OrderUpdate.hidden = YES;
    [self buttonConfig];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_OrderUpdate_Click:(id)sender {//联系车主
    
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    
    
    
    NSString *type = @"POST";
    NSString *url = @"app/clt_commend_order/";
    NSString *info = [NSString stringWithFormat:@"or_id=%@&dr_tel=%@",self.currentOrderID,self.dr_tel];
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    NSString *responseString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_DDXQ_responseString:%@",responseString);
    
    [self.navigationController popToRootViewControllerAnimated:true];
    
}

- (IBAction)button_CheckInfo_Click:(id)sender {
    ZCViewController_BJLB *vc = [[ZCViewController_BJLB alloc]initWithNibName:@"ZCViewController_BJLB" bundle:nil];
    vc.currentOrderID = self.currentOrderID;
    [self.navigationController pushViewController:vc animated:true];
}

- (IBAction)button_ckwl_Click:(id)sender {
    
    if ([self.or_status  isEqual: @"2"]) {//已完成
        ZCViewController_PJ *vc = [[ZCViewController_PJ alloc]initWithNibName:@"ZCViewController_PJ" bundle:nil];
        [self.navigationController pushViewController:vc animated:false];
    }
    else{
        ZCViewController_WLXQ *vc = [[ZCViewController_WLXQ alloc]init];
        vc.or_id = self.currentOrderID;
        [self.navigationController pushViewController:vc animated:false];
    }
    
}


- (void)scrollViewConfig{
    self.scrollView.contentSize = CGSizeMake(297, 700);
    self.scrollView.bounces = NO;
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
    [customLab setText:@"订单详情"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)getData{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    //NSString *url = @"http://115.28.107.151:8082/t/app/order/?longitude=125&latitude=45";
    NSString *url = [NSString stringWithFormat:@"app/clt_order_detail/?or_id=%@",self.currentOrderID];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_DDXQ_getData%@",resultString);
    _infoDic  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
}

- (void)textInfoConfig{
    //self.label_info.font = [UIFont systemFontOfSize:14];
    self.label_info.text = [_infoDic objectForKey:@"or_title"];
    //CGSize size = CGSizeMake(320, 40);
    //self.scrollView.contentSize = size;
    //NSLog(@"ZCViewController_DDXQ_textInfoConfig_or_title%@",[_infoDic objectForKey:@"or_title"]);
}

- (void)textIntroduceConfig{
    self.text_introduce.font = [UIFont systemFontOfSize:14];
    //self.text_introduce.enabled = NO;
    self.text_introduce.text = [_infoDic objectForKey:@"or_request"];
}

- (void)textZCDDConfig{
    self.text_zcdd.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_infoDic objectForKey:@"or_start"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_zcdd.rightView = label;
    self.text_zcdd.rightViewMode = UITextFieldViewModeAlways;
    //NSLog(@"1");
}

- (void)textXCDDConfig{
    self.text_xcdd.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_infoDic objectForKey:@"or_end"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_xcdd.rightView = label;
    self.text_xcdd.rightViewMode = UITextFieldViewModeAlways;
}

- (void)textDHSJConfig{
    self.text_dhsj.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_infoDic objectForKey:@"or_startTime"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_dhsj.rightView = label;
    self.text_dhsj.rightViewMode = UITextFieldViewModeAlways;
}

- (void)textDDSJConfig{
    self.text_ddsj.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_infoDic objectForKey:@"or_endTime"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_ddsj.rightView = label;
    self.text_ddsj.rightViewMode = UITextFieldViewModeAlways;
}

- (void)textHPMCConfig{
    self.text_hpmc.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_infoDic objectForKey:@"or_name"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_hpmc.rightView = label;
    self.text_hpmc.rightViewMode = UITextFieldViewModeAlways;
}

- (void)textHBConfig{
    
    self.text_hb.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    //label.text = [_infoDic objectForKey:@"or_board"];
    NSNumber *num = [_infoDic objectForKey:@"or_board"];
    label.text = num.stringValue;
    label.textAlignment = NSTextAlignmentLeft;
    self.text_hb.rightView = label;
    self.text_hb.rightViewMode = UITextFieldViewModeAlways;
    
}

- (void)textSLConfig{
    self.text_sl.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    //label.text = [_infoDic objectForKey:@"or_number"];
    NSNumber *num = [_infoDic objectForKey:@"or_number"];
    label.text = num.stringValue;
    label.textAlignment = NSTextAlignmentLeft;
    self.text_sl.rightView = label;
    self.text_sl.rightViewMode = UITextFieldViewModeAlways;
}

- (void)textZZLConfig{
    self.text_zzl.enabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    label.font = [UIFont systemFontOfSize:13];
    
    NSNumber *num = [_infoDic objectForKey:@"or_weight"];
    label.text = num.stringValue;
    
    //label.text = [_infoDic objectForKey:@"or_weight"];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_zzl.rightView = label;
    self.text_zzl.rightViewMode = UITextFieldViewModeAlways;
}

- (void)buttonConfig{
    if (!(self.dr_tel == nil)) {
        self.button_OrderUpdate.hidden = NO;
    }
    if (![self.or_status  isEqual: @"0"]) {//非显示中
        self.button_CheckInfo.hidden = YES;
        
    }
    if ([self.or_status  isEqual: @"2"]) {//已完成
        self.button_CheckInfo.hidden = YES;
        
        [self.button_ckwl setTitle:@"评价" forState:UIControlStateNormal];
    }
    if ([self.or_status  isEqual: @"3"]) {//已关闭
        self.button_CheckInfo.hidden = YES;
        self.button_ckwl.hidden = YES;
    }
}
@end
