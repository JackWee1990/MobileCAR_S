//
//  ZCViewController_BJXQ.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-17.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_BJXQ.h"

@interface ZCViewController_BJXQ ()

@end

@implementation ZCViewController_BJXQ

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
    [self textFieldConfig];
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"报价详情"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    //NSString *url = @"http://115.28.107.151:8082/t/app/order/?longitude=125&latitude=45";
    NSString *url = [NSString stringWithFormat:@"app/clt_offer_detail/?of_id=%@",self.of_id];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    //NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    //NSLog(@"ZCViewController_BJXQ_getData%@",resultString);
    _infoDic  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"ZCViewController_BJXQ_getData%@",_infoDic);
}

- (IBAction)textField_Click:(id)sender {
    
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    
    
    
    NSString *type = @"POST";
    NSString *url = @"app/clt_confirm/";  //@"app/offer_confirm/";
    NSString *info = [NSString stringWithFormat:@"of_id=%@",self.of_id];
    
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    NSString *responseString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_BJXQ_responseString:%@",responseString);
    
    
    
    //[self.navigationController popViewControllerAnimated:true];
    [self.navigationController popToRootViewControllerAnimated:true];
    //ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]initWithNibName:@"ZCViewController_WDDD" bundle:nil];
    
    //vc.clt_mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_mail"];
    
    //[self.navigationController pushViewController:vc animated:true];
    //NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
}

- (void)textFieldConfig{
    [self textField_name_Config];
    [self textField_tel_Config];
    [self textField_iden_Config];
    [self textField_number_Config];
    [self textField_hand_Config];
    [self textField_type_Config];
    [self textField_length_Config];
    [self textField_weight_Config];
    [self textField_distance_Config];
    
}


- (void)textField_name_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 车主姓名 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_name.leftView = label;
    self.textField_name.leftViewMode = UITextFieldViewModeAlways;
    self.textField_name.text = [_infoDic objectForKey:@"dr_name"];
}
- (void)textField_tel_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 联系方式 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_tel.leftView = label;
    self.textField_tel.leftViewMode = UITextFieldViewModeAlways;
    self.textField_tel.text = [_infoDic objectForKey:@"dr_tel"];
}
- (void)textField_iden_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 身份证号码 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_iden.leftView = label;
    self.textField_iden.leftViewMode = UITextFieldViewModeAlways;
    self.textField_iden.text = [_infoDic objectForKey:@"dr_iden"];
}
- (void)textField_number_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 货车车牌号码 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_number.leftView = label;
    self.textField_number.leftViewMode = UITextFieldViewModeAlways;
    self.textField_number.text = [_infoDic objectForKey:@"dr_number"];
}
- (void)textField_hand_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 挂车车牌号码 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_hand.leftView = label;
    self.textField_hand.leftViewMode = UITextFieldViewModeAlways;
    self.textField_hand.text = [_infoDic objectForKey:@"dr_hand"];
}
- (void)textField_type_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 车辆类型 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_type.leftView = label;
    self.textField_type.leftViewMode = UITextFieldViewModeAlways;
    self.textField_type.text = [_infoDic objectForKey:@"dr_type"];
}
- (void)textField_length_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 车辆长度 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_length.leftView = label;
    self.textField_length.leftViewMode = UITextFieldViewModeAlways;
    self.textField_length.text = [_infoDic objectForKey:@"dr_length"];
}
- (void)textField_weight_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 最大载重 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_weight.leftView = label;
    self.textField_weight.leftViewMode = UITextFieldViewModeAlways;
    self.textField_weight.text = [_infoDic objectForKey:@"dr_weight"];
}
- (void)textField_distance_Config{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 105, 30)];
    label.text = @" 距离 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.textField_distance.leftView = label;
    self.textField_distance.leftViewMode = UITextFieldViewModeAlways;
    NSNumber *dis = [_infoDic objectForKey:@"of_distance"];
    
    self.textField_distance.text = dis.stringValue;
}


@end
