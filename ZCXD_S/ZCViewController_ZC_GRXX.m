//
//  ZCViewController_ZC_GRXX.m
//  ZCXD
//
//  Created by JackWee on 14-8-8.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_ZC_GRXX.h"

@interface ZCViewController_ZC_GRXX ()

@end

@implementation ZCViewController_ZC_GRXX

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view setBackgroundColor:[UIColor grayColor]];
    //[self.view setBackgroundColor:[UIColor grayColor]];
    //self.view.backgroundColor

    [self arrConfig];
    [self scViewConfig];
    [self.view addGestureRecognizer:self.tap_space];
    [self titleViewConfig];
    [self textIDConfig];
    [self textNameConfig];
    [self textPhoneNumConfig];
    [self textPWDConfig];
    [self textPWDRConfig];
    [self textCompanyConfig];
    [self textJobConfig];
    [self textFieldConfig];
    [self textAcessWayConfig];
    [self test];
    [self buttonConfig];
    
    if (self.tag == 2) {
        self.button_field.hidden = YES;
        self.button_job.hidden = YES;
        self.button_access.hidden = YES;
        self.button_next.hidden = YES;
        self.text_mm.hidden = YES;
        self.text_qrmm.hidden = YES;
        [self getData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button_next_Click:(id)sender {
    if (//判断各属性是否为空及验证密码
    (![self.text_mm.text  isEqual: @""])&&
    (![self.text_sjhm.text  isEqual: @""])&&
    (![self.text_sfz.text  isEqual: @""])&&
    (![self.text_xm.text  isEqual: @""])&&
        ([self.text_mm.text isEqual:self.text_qrmm.text])&&
        (![self.text_gsmc.text  isEqual: @""])&&
        (![self.text_zw.text  isEqual: @""])&&
        (![self.text_hy.text  isEqual: @""])&&
        (![self.text_fwtj.text  isEqual: @""])
        )
    {
        switch (self.tag) {
            case 1:
                [self regUserInfo];
                break;
            case 2:
                [self UpdateUserInfo];
                break;
            default:
                break;
        }
    }
}

- (void)titleViewConfig{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    switch (self.tag) {
        case 1:
            [customLab setText:@"注册"];
            break;
        case 2:
            [customLab setText:@"个人信息"];
            break;
            
        default:
            break;
    }
    //[customLab setText:@"注册"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    //self.navigationItem.titleView = customLab;
}

- (void)textNameConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 姓名 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_xm.leftView = label;
    self.text_xm.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textPhoneNumConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 联系电话 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_sjhm.leftView = label;
    self.text_sjhm.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textIDConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" Email :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_sfz.leftView = label;
    self.text_sfz.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textPWDConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 密码 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_mm.leftView = label;
    self.text_mm.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textPWDRConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 确认密码 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_qrmm.leftView = label;
    self.text_qrmm.leftViewMode = UITextFieldViewModeAlways;
}

- (IBAction)tap_space_Click:(id)sender {
    [self.text_mm resignFirstResponder];
    [self.text_qrmm resignFirstResponder];
    [self.text_sfz resignFirstResponder];
    [self.text_sjhm resignFirstResponder];
    [self.text_xm resignFirstResponder];
    [self.text_gsmc resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated{
    //UIColor *bgColor = [[UIColor alloc]initWithWhite: 1.0 alpha: 0.95];
    //[bgColor initWithWhite: 1.0 alpha: 0.50];
    //[self.view setBackgroundColor:bgColor];
    //self.view.backgroundColor = [[UIColor alloc]initWithWhite: 1.0 alpha: 0.95];
}

- (void)scViewConfig{
    self.scView.contentSize = CGSizeMake(288, 700);
}

- (void)textCompanyConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 公司名称 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_gsmc.leftView = label;
    self.text_gsmc.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textJobConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 职位 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_zw.leftView = label;
    self.text_zw.leftViewMode = UITextFieldViewModeAlways;
    self.text_zw.enabled = NO;
}

- (void)textFieldConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 行业 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_hy.leftView = label;
    self.text_hy.leftViewMode = UITextFieldViewModeAlways;
    self.text_hy.enabled = NO;
}

- (void)textAcessWayConfig{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    label.text = @" 访问途径 :";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    self.text_fwtj.leftView = label;
    self.text_fwtj.leftViewMode = UITextFieldViewModeAlways;
    self.text_fwtj.enabled = NO;
}

- (void)arrConfig{
    self.arr_job = [[NSArray alloc]initWithObjects:@"所有者",@"首席执行官",@"副总裁",@"董事/总经理",@"高级经理",@"经理",@"主管",@"销售代表",@"客户经理",@"分析师/研究员",@"顾问",@"业务操作/专家", nil];
    
    self.arr_field = [[NSArray alloc]initWithObjects:@"农业",@"汽车制造业",@"化学品和塑料工业",@"快速消费品",@"电子工业",@"餐饮业",@"医疗保健",@"制造业",@"造纸业",@"零售业/批发业",@"钢铁/金属业",@"纺织品",@"运输/物流",@"电商", nil];
    
    self.arr_access = [[NSArray alloc]initWithObjects:@"电邮广告",@"百度搜索引擎",@"推荐",@"新闻/媒体",@"报纸", nil];

}

- (IBAction)button_job_Click:(id)sender {
    
    if (self.tv_Job.hidden == NO) {
        self.tv_Job.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 1;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
    
}

- (IBAction)button_field_Click:(id)sender {
    if (self.tv_Field.hidden == NO) {
        self.tv_Field.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 2;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
}

- (IBAction)button_access_Click:(id)sender {
    if (self.tv_Access.hidden == NO) {
        self.tv_Access.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 3;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
}

- (void)tvConfig{
    switch (self.tag_button) {
        case 0:
            //do nothing
            break;
        case 1:
            
            self.arr_current = self.arr_job;
            self.tv_Job.hidden = NO;
            self.tv_Field.hidden = YES;
            self.tv_Access.hidden = YES;
            
            self.tv_Field.delegate = nil;
            self.tv_Field.dataSource = nil;
            self.tv_Access.delegate = nil;
            self.tv_Access.dataSource = nil;
            self.tv_Job.delegate = self;
            self.tv_Job.dataSource = self;
            [self.tv_Job reloadData];
            //[self test];
            break;
        case 2:
            
            self.arr_current = self.arr_field;
            self.tv_Job.hidden = YES;
            self.tv_Field.hidden = NO;
            self.tv_Access.hidden = YES;
            /*
            self.tv_Job.delegate = nil;
            self.tv_Job.dataSource = nil;
            self.tv_Access.delegate = nil;
            self.tv_Access.dataSource = nil;
             */
            self.tv_Field.delegate = self;
            self.tv_Field.dataSource = self;
            [self.tv_Field reloadData];
            break;
        case 3:
            
            self.arr_current = self.arr_access;
            self.tv_Job.hidden = YES;
            self.tv_Field.hidden = YES;
            self.tv_Access.hidden = NO;
            
            self.tv_Field.delegate = nil;
            self.tv_Field.dataSource = nil;
            self.tv_Job.delegate = nil;
            self.tv_Job.dataSource = nil;
            self.tv_Access.delegate = self;
            self.tv_Access.dataSource = self;
            [self.tv_Access reloadData];
            break;
        default:
            break;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"@@@");
    return self.arr_current.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"!");
    
    //self.cell_Field.textLabel.text =
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];

    
    cell.textLabel.text = [self.arr_current objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)test{
    /*
    for (int i = 0; i < self.arr_current.count; i++) {
        NSLog(@"GRXX_arr[]_%@",[self.arr_current objectAtIndex:i]);
    }*/
    /*
    self.arr_current = self.arr_job;
    self.tv_Job.hidden = NO;
    self.tv_Field.hidden = YES;
    self.tv_Access.hidden = YES;
    
    self.tv_Field.delegate = nil;
    self.tv_Field.dataSource = nil;
    self.tv_Access.delegate = nil;
    self.tv_Access.dataSource = nil;
    self.tv_Job.delegate = self;
    self.tv_Job.dataSource = self;
     */
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (self.tag_button) {
        case 1:
            
            self.text_zw.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_Job.hidden = YES;
            
            break;
        case 2:
            self.text_hy.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_Field.hidden = YES;
            break;
        case 3:
            self.text_fwtj.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_Access.hidden = YES;
            break;
        default:
            break;
    }
    [self.view addGestureRecognizer:self.tap_space];
}

- (void)buttonConfig{
    switch (self.tag) {
        case 1:
            [self.button_next setTitle:@"提交" forState:UIControlStateNormal];
            self.button_next.titleLabel.font = [UIFont systemFontOfSize:18];
            //[self.button_next.titleLabel setText:@"提交"];
            break;
        case 2:
            [self.button_next setTitle:@"修改" forState:UIControlStateNormal];
            self.button_next.titleLabel.font = [UIFont systemFontOfSize:18];
            break;
            
        default:
            break;
    }
}

- (void)regUserInfo{
    NSData *resultData = nil;
    HttpController *httpCpntroller = [[HttpController alloc]init];
    NSString *type = @"POST";
    NSString *url = [NSString stringWithFormat:@"app/clt_reg/"];
    NSString *info = [NSString stringWithFormat:@"clt_mail=%@&clt_pwd=%@&clt_name=%@&clt_tel=%@&clt_company=%@&clt_position=%@&clt_industry=%@&clt_from=%@",self.text_sfz.text,self.text_mm.text,self.text_xm.text,self.text_sjhm.text,self.text_gsmc.text,self.text_zw.text,self.text_hy.text,self.text_fwtj.text];
    resultData = [httpCpntroller httpHandleWithType:type url:url info:info];
   
    NSString *responseString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZC_regUserInfo_responseString:%@",responseString);
    ZCViewController_DL *vc = [self.storyboard instantiateViewControllerWithIdentifier: @"ZCViewController_DL"];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)UpdateUserInfo{
    
}

- (void)getData{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    
    
    
    NSString *type = @"POST";
    NSString *url = @"app/clt_login/";
    
    NSString *mail = [[NSUserDefaults standardUserDefaults] valueForKey:@"clt_mail"];
    NSString *pwd = [[NSUserDefaults standardUserDefaults] valueForKey:@"clt_pwd"];
    
    NSString *info = [NSString stringWithFormat:@"clt_mail=%@&clt_pwd=%@",mail,pwd];
    
    
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    NSString *responseString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_GRXX_responseString:%@",responseString);
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *inDic = [resultDic objectForKey:@"data"];
    
    self.text_sfz.text = [inDic objectForKey:@"clt_mail"];
    self.text_sjhm.text = [inDic objectForKey:@"clt_tel"];
    self.text_xm.text = [inDic objectForKey:@"clt_name"];
    self.text_gsmc.text = [inDic objectForKey:@"clt_company"];
    self.text_zw.text = [inDic objectForKey:@"clt_position"];
    self.text_hy.text = [inDic objectForKey:@"clt_industry"];
    self.text_fwtj.text = [inDic objectForKey:@"clt_from"];
    
    
}
@end
