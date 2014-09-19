//
//  ZCViewController_FBDD.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-9.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_FBDD.h"

@interface ZCViewController_FBDD ()

@end

@implementation ZCViewController_FBDD

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
    //[self.view setAlpha:0.97];
    [self arrConfig];
    [self scrollViewConfig];
    [self textFieldConfig];
    [self navConfig];
    [self.view addGestureRecognizer:self.tap_space];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    //[self.view setAlpha:0.97];
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

- (void)scrollViewConfig{
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //self.scrollView.frame = CGRectMake(20, 110, 300, 750);
    self.scrollView.frame = CGRectMake(20, 110, 280, 1125);
    CGSize size = CGSizeMake(280, 2000);
    self.scrollView.contentSize = size;
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

- (IBAction)button_selectSource_Click:(id)sender {
    //[self test];
    
    if (
        (![self.textField_thsj.text isEqual:@""])&&
        (![self.textField_ddsj.text isEqual:@""])&&
        (![self.textField_bt.text isEqual:@""])&&
        (![self.textField_bj.text isEqual:@""])&&
        (![self.textField_hpmc.text isEqual:@""])&&
        (![self.textField_zjz.text isEqual:@""])&&
        (![self.textField_ydshb.text isEqual:@""])&&
        (![self.textField_ydssl.text isEqual:@""])&&
        (![self.textField_zzlwds.text isEqual:@""])&&
        (![self.textField_cc.text isEqual:@""])&&
        (![self.textField_cck.text isEqual:@""])&&
        (![self.textField_ccg.text isEqual:@""])&&
        (![self.textField_ztj.text isEqual:@""])&&
        (![self.textField_nxynzhc.text isEqual:@""])&&
        (![self.textField_nxydclcd.text isEqual:@""])&&
        (![self.textField_sfxysjxz.text isEqual:@""])&&
        (![self.textView_xqsm.text isEqual:@""])
        )
    {
        ZCViewController_Root *vc = [[ZCViewController_Root alloc]init];
        
        vc.time_thsj = self.textField_thsj.text;
        vc.time_ddsj = self.textField_ddsj.text;
        
        vc.textField_bt = self.textField_bt.text;
        vc.textField_bj = self.textField_bj.text;
        vc.textField_hpmc = self.textField_hpmc.text;
        vc.textField_zjz = self.textField_zjz.text;
        vc.textField_ydshb = self.textField_ydshb.text;
        vc.textField_ydssl = self.textField_ydssl.text;
        vc.textField_zzlwds = self.textField_zzlwds.text;
        vc.textField_cc = self.textField_cc.text;
        vc.textField_cck = self.textField_cck.text;
        vc.textField_ccg = self.textField_ccg.text;
        vc.textField_ztj = self.textField_ztj.text;
        vc.textField_nxynzhc = self.textField_nxynzhc.text;
        vc.textField_nxydclcd = self.textField_nxydclcd.text;
        vc.textField_sfxysjxz = self.textField_sfxysjxz.text;
        vc.textView_xqsm = self.textView_xqsm.text;
        vc.sc_wxp = [self.sc_wxp titleForSegmentAtIndex:[self.sc_wxp selectedSegmentIndex]];
        vc.sc_kdf = [self.sc_wxp titleForSegmentAtIndex:[self.sc_kdf selectedSegmentIndex]];
        vc.sc_zf = [self.sc_wxp titleForSegmentAtIndex:[self.sc_zf selectedSegmentIndex]];
        vc.sc_bx = [self.sc_wxp titleForSegmentAtIndex:[self.sc_bx selectedSegmentIndex]];
        
        
        
        [self.navigationController pushViewController:vc animated:true];
    }
    else{
        NSLog(@"FBDD_something is Empty");
    }
    /*
    ZCViewController_Root *vc = [[ZCViewController_Root alloc]init];
    
    vc.time_thsj = self.textField_thsj.text;
    vc.time_ddsj = self.textField_ddsj.text;
    
    vc.textField_bt = self.textField_bt.text;
    vc.textField_bj = self.textField_bj.text;
    vc.textField_hpmc = self.textField_hpmc.text;
    vc.textField_zjz = self.textField_zjz.text;
    vc.textField_ydshb = self.textField_ydshb.text;
    vc.textField_ydssl = self.textField_ydssl.text;
    vc.textField_zzlwds = self.textField_zzlwds.text;
    vc.textField_cc = self.textField_cc.text;
    vc.textField_cck = self.textField_cck.text;
    vc.textField_ccg = self.textField_ccg.text;
    vc.textField_ztj = self.textField_ztj.text;
    vc.textField_nxynzhc = self.textField_nxynzhc.text;
    vc.textField_nxydclcd = self.textField_nxydclcd.text;
    vc.textField_sfxysjxz = self.textField_sfxysjxz.text;
    vc.textView_xqsm = self.textView_xqsm.text;
    vc.sc_wxp = [self.sc_wxp titleForSegmentAtIndex:[self.sc_wxp selectedSegmentIndex]];
    vc.sc_kdf = [self.sc_wxp titleForSegmentAtIndex:[self.sc_kdf selectedSegmentIndex]];
    vc.sc_zf = [self.sc_wxp titleForSegmentAtIndex:[self.sc_zf selectedSegmentIndex]];
    vc.sc_bx = [self.sc_wxp titleForSegmentAtIndex:[self.sc_bx selectedSegmentIndex]];
    
    
    
    [self.navigationController pushViewController:vc animated:true];
    */
    
    
}

- (IBAction)tap_space_Click:(id)sender {
    [self.textField_thsj resignFirstResponder];
    [self.textField_ddsj resignFirstResponder];
    [self.textField_hpmc resignFirstResponder];
    [self.textField_zjz resignFirstResponder];
    [self.textField_ydshb resignFirstResponder];
    [self.textField_ydssl resignFirstResponder];
    [self.textField_zzlwds resignFirstResponder];
    [self.textField_cc resignFirstResponder];
    [self.textField_ztj resignFirstResponder];
    [self.textField_nxydclcd resignFirstResponder];
    [self.textField_bt resignFirstResponder];
    [self.textView_xqsm resignFirstResponder];
    [self.textField_cck resignFirstResponder];
    [self.textField_ccg resignFirstResponder];
}

- (IBAction)button_sjxz_Click:(id)sender {
    if (self.tv_sjxz.hidden == NO) {
        self.tv_sjxz.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 3;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
}

- (IBAction)button_tsbj_Click:(id)sender {
    if (self.tv_tsbj.hidden == NO) {
        self.tv_tsbj.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 1;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
}

- (IBAction)button_type_Click:(id)sender {
    if (self.tv_type.hidden == NO) {
        self.tv_type.hidden = YES;
        [self.view addGestureRecognizer:self.tap_space];
    }
    else{
        self.tag_button = 2;
        [self tvConfig];
        [self.view removeGestureRecognizer:self.tap_space];
    }
}

- (void)textFieldConfig{

    [self textFieldConfigWithTitle:@" 需求标题 :" textField:self.textField_bt labelWidth:80];
    [self textFieldConfigWithTitle:@" 推送半径(km) :" textField:self.textField_bj labelWidth:120];
    self.textField_bj.enabled = NO;
    [self textFieldConfigWithTitle:@" 提货时间 :" textField:self.textField_thsj labelWidth:80];
    self.textField_thsj.text = self.time_thsj;
    self.textField_thsj.enabled = NO;
    [self textFieldConfigWithTitle:@" 到达时间 :" textField:self.textField_ddsj labelWidth:80];
    self.textField_ddsj.text = self.time_ddsj;
    self.textField_ddsj.enabled = NO;
    
    //NSLog(@"FBDD_thsj=%@",self.time_thsj);
    //NSLog(@"FBDD_ddsj=%@",self.time_ddsj);
    
    [self textFieldConfigWithTitle:@" 货品名称 :" textField:self.textField_hpmc labelWidth:80];
    [self textFieldConfigWithTitle:@" 总价值 :" textField:self.textField_zjz labelWidth:80];
    [self textFieldConfigWithTitle:@" 有多少货板 :" textField:self.textField_ydshb labelWidth:120];
    [self textFieldConfigWithTitle:@" 有多少数量 :" textField:self.textField_ydssl labelWidth:120];
    [self textFieldConfigWithTitle:@" 总重为多少 :" textField:self.textField_zzlwds labelWidth:120];
    [self textFieldConfigWithTitle:@" 尺寸—长 :" textField:self.textField_cc labelWidth:80];
    [self textFieldConfigWithTitle:@" 尺寸—宽 :" textField:self.textField_cck labelWidth:80];
    [self textFieldConfigWithTitle:@" 尺寸—高 :" textField:self.textField_ccg labelWidth:80];
    [self textFieldConfigWithTitle:@" 总体积 :" textField:self.textField_ztj labelWidth:80];
    [self textFieldConfigWithTitle:@" 您需要哪种货车 :" textField:self.textField_nxynzhc labelWidth:160];
    [self textFieldConfigWithTitle:@" 您需要的车辆长度 :" textField:self.textField_nxydclcd labelWidth:160];
    [self textFieldConfigWithTitle:@" 是否包含危险品 :" textField:self.textField_sfbhwxp labelWidth:160];
    [self textFieldConfigWithTitle:@" 货物可堆放 :" textField:self.textField_hwkdf labelWidth:160];
    [self textFieldConfigWithTitle:@" 底板载荷 :" textField:self.textField_sdbzh labelWidth:160];
    [self textFieldConfigWithTitle:@" 是否需要司机协助装载 :" textField:self.textField_sfxysjxz labelWidth:160];
    [self textFieldConfigWithTitle:@" 是否需要购买货物保险 :" textField:self.textField_sfxygmbx labelWidth:160];
    //[self textFieldConfigWithRightView:self.textField_sfbhwxp sc:self.sc_wxp];
    //[self textFieldConfigWithRightView:self.textField_hwkdf sc:self.sc_df];
    //[self textFieldConfigWithRightView:self.textField_sdbzh sc:self.sc_dbzh];
    //[self textFieldConfigWithRightView:self.textField_sfxysjxz sc:self.sc_sjxz];
    //[self textFieldConfigWithRightView:self.textField_sfxygmbx sc:self.sc_bx];
    
    self.textField_bt.text = self.textField_bt_;
    self.textField_bj.text = self.textField_bj_;
    self.textField_hpmc.text = self.textField_hpmc_;
    self.textField_zjz.text = self.textField_zjz_;
    self.textField_ydshb.text = self.textField_ydshb_;
    self.textField_ydssl.text = self.textField_ydssl_;
    self.textField_zzlwds.text = self.textField_zzlwds_;
    self.textField_cc.text = self.textField_cc_;
    self.textField_cck.text = self.textField_cck_;
    self.textField_ccg.text = self.textField_ccg_;
    self.textField_ztj.text = self.textField_ztj_;
    self.textField_nxynzhc.text = self.textField_nxynzhc_;
    self.textField_nxydclcd.text = self.textField_nxydclcd_;
    self.textField_sfxysjxz.text = self.textField_sfxysjxz_;
    self.textView_xqsm.text = self.textView_xqsm_;
    self.sc_wxp.selectedSegmentIndex =self.sc_wxp_index;
    self.sc_kdf.selectedSegmentIndex = self.sc_kdf_index;
    self.sc_zf.selectedSegmentIndex = self.sc_zf_index;
    self.sc_bx.selectedSegmentIndex = self.sc_bx_index;
    
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
    [customLab setText:@"ZCXD"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (IBAction)button_st_Click:(id)sender {
    ZCViewController_Date *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_Date"];
    vc.time_thsj = self.time_thsj;
    vc.time_ddsj = self.time_ddsj;
    
    vc.textField_bt = self.textField_bt.text;
    vc.textField_bj = self.textField_bj.text;
    vc.textField_hpmc = self.textField_hpmc.text;
    vc.textField_zjz = self.textField_zjz.text;
    vc.textField_ydshb = self.textField_ydshb.text;
    vc.textField_ydssl = self.textField_ydssl.text;
    vc.textField_zzlwds = self.textField_zzlwds.text;
    vc.textField_cc = self.textField_cc.text;
    vc.textField_cck = self.textField_cck.text;
    vc.textField_ccg = self.textField_ccg.text;
    vc.textField_ztj = self.textField_ztj.text;
    vc.textField_nxynzhc = self.textField_nxynzhc.text;
    vc.textField_nxydclcd = self.textField_nxydclcd.text;
    vc.textField_sfxysjxz = self.textField_sfxysjxz.text;
    vc.textView_xqsm = self.textView_xqsm.text;
    vc.sc_wxp_index = [self.sc_wxp selectedSegmentIndex];
    vc.sc_kdf_index = [self.sc_kdf selectedSegmentIndex];
    vc.sc_zf_index = [self.sc_zf selectedSegmentIndex];
    vc.sc_bx_index = [self.sc_bx selectedSegmentIndex];
    
    
    /*
     @property (nonatomic,strong) NSString *textField_bt;
     @property (nonatomic,strong) NSString *textField_bj;
     @property (nonatomic,strong) NSString *textField_hpmc;
     @property (nonatomic,strong) NSString *textField_zjz;
     @property (nonatomic,strong) NSString *textField_ydshb;
     @property (nonatomic,strong) NSString *textField_ydssl;
     @property (nonatomic,strong) NSString *textField_zzlwds;
     @property (nonatomic,strong) NSString *textField_cc;
     @property (nonatomic,strong) NSString *textField_cck;
     @property (nonatomic,strong) NSString *textField_ccg;
     @property (nonatomic,strong) NSString *textField_ztj;
     @property (nonatomic,strong) NSString *textField_nxynzhc;
     @property (nonatomic,strong) NSString *textField_nxydclcd;
     @property (nonatomic,strong) NSString *textField_sfxysjxz;
     @property (nonatomic,strong) NSString *textView_xqsm;
     @property (nonatomic,assign) int *sc_wxp_index;
     @property (nonatomic,assign) int *sc_kdf_index;
     @property (nonatomic,assign) int *sc_zf_index;
     @property (nonatomic,assign) int *sc_bx_index;
     */
    
    vc.tag = 1;
    [self.navigationController pushViewController:vc animated:true];
}

- (IBAction)button_en_Click:(id)sender {
    ZCViewController_Date *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_Date"];
    
    vc.textField_bt = self.textField_bt.text;
    vc.textField_bj = self.textField_bj.text;
    vc.textField_hpmc = self.textField_hpmc.text;
    vc.textField_zjz = self.textField_zjz.text;
    vc.textField_ydshb = self.textField_ydshb.text;
    vc.textField_ydssl = self.textField_ydssl.text;
    vc.textField_zzlwds = self.textField_zzlwds.text;
    vc.textField_cc = self.textField_cc.text;
    vc.textField_cck = self.textField_cck.text;
    vc.textField_ccg = self.textField_ccg.text;
    vc.textField_ztj = self.textField_ztj.text;
    vc.textField_nxynzhc = self.textField_nxynzhc.text;
    vc.textField_nxydclcd = self.textField_nxydclcd.text;
    vc.textField_sfxysjxz = self.textField_sfxysjxz.text;
    vc.textView_xqsm = self.textView_xqsm.text;
    vc.sc_wxp_index = [self.sc_wxp selectedSegmentIndex];
    vc.sc_kdf_index = [self.sc_kdf selectedSegmentIndex];
    vc.sc_zf_index = [self.sc_zf selectedSegmentIndex];
    vc.sc_bx_index = [self.sc_bx selectedSegmentIndex];
    
    vc.tag = 2;
    vc.time_thsj = self.time_thsj;
    vc.time_ddsj = self.time_ddsj;
    [self.navigationController pushViewController:vc animated:true];
}

- (void)textFieldConfigWithRightView:(UITextField*)textField sc:(UISegmentedControl*)segmentedControl{//没用上
    
    segmentedControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(170, 5, 70, 30)];
    NSArray *arr = [[NSArray alloc]initWithObjects:@"是",@"否",nil];
    [segmentedControl initWithItems:arr];
    //[segmentedControl setTitle:@"是" forSegmentAtIndex:0];
    //[segmentedControl setTitle:@"否" forSegmentAtIndex:1];
    textField.rightView = segmentedControl;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    
}

- (void)arrConfig{
    self.arr_tsbj = [[NSArray alloc]initWithObjects:@"5",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100", nil];
    self.arr_sjxz = [[NSArray alloc]initWithObjects:@"装卸都需要",@"仅装车服务",@"仅卸车服务",@"无", nil];
    [self getCarType];
    
    self.arr_type = [[NSArray alloc]init];
    
    NSMutableArray *marr_type = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.arr_typeRoadFromServer.count; i++) {
        NSDictionary *server_dic = [self.arr_typeRoadFromServer objectAtIndex:i];
        NSString *type = [server_dic objectForKey:@"type"];
        //NSLog(@"FBDD_arrConfig_type_in_arr_typeRoadFromServer:%@",type);
        //[self.arr_type arrayByAddingObject:type];
        [marr_type addObject:type];
    }
    //NSLog(@"FBDD_arrConfig_marr_type:%@",marr_type);
    self.arr_type = [[NSArray alloc]initWithArray:marr_type];
    
    NSLog(@"FBDD_arrConfig_type:%@",self.arr_type);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_current.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    
    cell.textLabel.text = [self.arr_current objectAtIndex:indexPath.row];
    return cell;
}

- (void)tvConfig{
    switch (self.tag_button) {
        case 0:
            //do nothing
            break;
        case 1:
            
            self.arr_current = self.arr_tsbj;
            self.tv_tsbj.hidden = NO;
            self.tv_type.hidden = YES;
            self.tv_sjxz.hidden = YES;
            
            self.tv_type.delegate = nil;
            self.tv_type.dataSource = nil;
            self.tv_sjxz.delegate = nil;
            self.tv_sjxz.dataSource = nil;
            self.tv_tsbj.delegate = self;
            self.tv_tsbj.dataSource = self;
            [self.tv_tsbj reloadData];
            //[self test];
            break;
        case 2:
            
            self.arr_current = self.arr_type;
            self.tv_tsbj.hidden = YES;
            self.tv_type.hidden = NO;
            self.tv_sjxz.hidden = YES;
            /*
             self.tv_Job.delegate = nil;
             self.tv_Job.dataSource = nil;
             self.tv_Access.delegate = nil;
             self.tv_Access.dataSource = nil;
             */
            self.tv_type.delegate = self;
            self.tv_type.dataSource = self;
            [self.tv_type reloadData];
            break;
        case 3:
            
            self.arr_current = self.arr_sjxz;
            self.tv_tsbj.hidden = YES;
            self.tv_type.hidden = YES;
            self.tv_sjxz.hidden = NO;
            
            self.tv_tsbj.delegate = nil;
            self.tv_tsbj.dataSource = nil;
            self.tv_type.delegate = nil;
            self.tv_type.dataSource = nil;
            self.tv_sjxz.delegate = self;
            self.tv_sjxz.dataSource = self;
            [self.tv_sjxz reloadData];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (self.tag_button) {
        case 1:
            
            self.textField_bj.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_tsbj.hidden = YES;
            
            break;
        case 2:
            self.textField_nxynzhc.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_type.hidden = YES;
            break;
        case 3:
            self.textField_sfxysjxz.text = [self.arr_current objectAtIndex:indexPath.row];
            self.tv_sjxz.hidden = YES;
            break;
        default:
            break;
    }
    [self.view addGestureRecognizer:self.tap_space];
}

- (void)getCarType{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    NSString *url = [NSString stringWithFormat:@"app/truck_type/"];
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"ZCViewController_FBDD_getCarType_resultString = %@",resultString);
    self.arr_typeRoadFromServer = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
}

- (void)test{
    NSLog(@"textField_bt:%@",self.textField_bt.text);
    NSLog(@"textField_bj:%@",self.textField_bj.text);
    NSLog(@"textField_thsj:%@",self.textField_thsj.text);
    NSLog(@"textField_ddsj:%@",self.textField_ddsj.text);
    NSLog(@"textField_hpmc:%@",self.textField_hpmc.text);
    NSLog(@"textField_zjz:%@",self.textField_zjz.text);
    NSLog(@"textField_ydshb:%@",self.textField_ydshb.text);
    NSLog(@"textField_ydssl:%@",self.textField_ydssl.text);
    NSLog(@"textField_zzlwds:%@",self.textField_zzlwds.text);
    NSLog(@"textField_cc:%@",self.textField_cc.text);
    NSLog(@"textField_cck:%@",self.textField_cck.text);
    NSLog(@"textField_ccg:%@",self.textField_ccg.text);
    NSLog(@"textField_ztj:%@",self.textField_ztj.text);
    NSLog(@"textField_nxynzhc:%@",self.textField_nxynzhc.text);
    NSLog(@"textField_nxydclcd:%@",self.textField_nxydclcd.text);
    NSLog(@"sc_wxp:%@",[self.sc_wxp titleForSegmentAtIndex:self.sc_wxp.selectedSegmentIndex]);
    NSLog(@"sc_kdf:%@",[self.sc_kdf titleForSegmentAtIndex:self.sc_kdf.selectedSegmentIndex]);
    NSLog(@"sc_zf:%@",[self.sc_zf titleForSegmentAtIndex:self.sc_zf.selectedSegmentIndex]);
    NSLog(@"sc_bx:%@",[self.sc_bx titleForSegmentAtIndex:self.sc_bx.selectedSegmentIndex]);
    NSLog(@"textField_sfxysjxz:%@",self.textField_sfxysjxz.text);
    NSLog(@"textView_xqsm:%@",self.textView_xqsm.text);
}


@end
