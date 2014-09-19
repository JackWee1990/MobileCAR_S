//
//  ZCViewController_SJXQ.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-18.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_SJXQ.h"

@interface ZCViewController_SJXQ ()

@end

@implementation ZCViewController_SJXQ

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
    [self textFieldConfig];
    [self navTitleConfig];
    [self navItemConfig];
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

- (IBAction)button_Click:(id)sender {
    ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]initWithNibName:@"ZCViewController_WDDD" bundle:nil];
    
    vc.clt_mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_mail"];
    vc.tag_source = 2;
    vc.dr_tel = self.dr_tel;
    [self.navigationController pushViewController:vc animated:true];
}

- (void)textFieldConfigWithTitle:(NSString*)title textField:(UITextField*)textField labelWidth:(double)width{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 35)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    textField.leftView = label;
    textField.leftViewMode = UITextFieldViewModeAlways;
    [textField setBackgroundColor:[UIColor whiteColor]];
}

- (void)textFieldConfig{
    [self textFieldConfigWithTitle:@" 联系方式:" textField:self.text_tel labelWidth:100];
    [self textFieldConfigWithTitle:@" 车主姓名:" textField:self.text_name labelWidth:100];
    [self textFieldConfigWithTitle:@" 身份证号码:" textField:self.text_iden labelWidth:100];
    [self textFieldConfigWithTitle:@" 车辆类型:" textField:self.text_type labelWidth:100];
    [self textFieldConfigWithTitle:@" 车牌号码:" textField:self.text_number labelWidth:100];
    [self textFieldConfigWithTitle:@" 挂车号码:" textField:self.text_hand labelWidth:100];
    [self textFieldConfigWithTitle:@" 车辆长度:" textField:self.text_length labelWidth:100];
    [self textFieldConfigWithTitle:@" 最大载重:" textField:self.text_weight labelWidth:100];
    
    self.text_tel.text = self.dr_tel;
    self.text_name.text = self.dr_name;
    self.text_iden.text = self.dr_iden;
    self.text_type.text = self.dr_type;
    self.text_number.text = self.dr_number;
    self.text_hand.text = self.dr_hand;
    self.text_length.text = self.dr_length;
    self.text_weight.text = self.dr_weight;
}

- (void)navTitleConfig{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"车主详情"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (void)navItemConfig{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;
    
    
}
@end
