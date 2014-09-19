//
//  ZCViewController.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-9.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController.h"

@interface ZCViewController ()

@end

@implementation ZCViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.isLogin = YES;//test
    [self getDataFromUserDefault];
    [self getCommendArr];
    [self baseArrConfig];
    [self navConfig];
    [self tapConfig];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_c1_Click:(id)sender {
    
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:0];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
    
    
}

- (IBAction)button_c2_Click:(id)sender {
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:1];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
}

- (IBAction)button_c3_Click:(id)sender {
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:2];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
}

- (IBAction)button_c4_Click:(id)sender {
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:3];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
}

- (IBAction)button_c5_Click:(id)sender {
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:4];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
}

- (IBAction)button_c6_Click:(id)sender {
    if (self.isLogin == NO) {
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_SJXQ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SJXQ"];
        
        NSDictionary *dic = [self.commendArr objectAtIndex:5];
        //NSLog(@"dic%@",dic);
        //NSString *dr_hand
        
        NSString *dr_hand = [dic objectForKey:@"dr_hand"];
        NSString *dr_iden = [dic objectForKey:@"dr_iden"];
        NSString *dr_length = [dic objectForKey:@"dr_length"];
        NSString *dr_name = [dic objectForKey:@"dr_name"];
        NSString *dr_number = [dic objectForKey:@"dr_number"];
        NSString *dr_tel = [dic objectForKey:@"dr_tel"];
        NSString *dr_type = [dic objectForKey:@"dr_type"];
        NSString *dr_weight = [dic objectForKey:@"dr_weight"];
        
        vc.dr_hand = dr_hand;
        vc.dr_iden = dr_iden;
        vc.dr_length = dr_length;
        vc.dr_name = dr_name;
        vc.dr_number = dr_number;
        vc.dr_tel = dr_tel;
        vc.dr_type = dr_type;
        vc.dr_weight = dr_weight;
        
        [self.navigationController pushViewController:vc animated:false];
    }
}

- (IBAction)button_submit_Click:(id)sender {
    
    if (self.isLogin == NO) {//若没登录 点击menu跳至登录页面
        [self pushViewControllerDL];
    }
    else{
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_FBDD"];
        [self.navigationController pushViewController:vc animated:false];
    }
    
    
}

- (IBAction)button_orderList_Click:(id)sender {
    
    if (self.isLogin == NO) {//若没登录 点击menu跳至登录页面
        [self pushViewControllerDL];
    }
    else{
        ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]initWithNibName:@"ZCViewController_WDDD" bundle:nil];
        vc.clt_mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_mail"];
        [self.navigationController pushViewController:vc animated:false];
    }
    
    
     
    
}

- (IBAction)tap_On_menu:(id)sender {
    //NSLog(@"VC_tap_On_menu");
    if (!self.menu) {
        [self addZCUIView_Menu];
        self.menu.frame = self.menu.frame = CGRectMake(-200, 0, 200, 568);
        [UIView animateWithDuration:0.3 animations:^{
            self.menu.frame = self.menu.frame = CGRectMake(0, 0, 200, 568);
            //self.view.alpha = 0.5;
        }];
    }
    else{
        [self menuClear];
    }
}

- (IBAction)tap_On_imagelogo_and_labelName_Click:(id)sender {
    [self pushViewControllerDL];
}

- (IBAction)tap_On_menu_left:(id)sender {
    [self menuClear];
}

- (void)setNavBarItemWhite{
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)navConfig{
    [self setNavBarItemWhite];
    [self navTitleConfig];
    [self navItemConfig];
}

- (void)navItemConfig{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;
    
    //设置leftBarButtonItem
    UIImage *leftImage = [UIImage imageNamed:@"image_root_cfg"];
    UIImageView *leftView = [[UIImageView alloc]initWithImage:leftImage];
    [leftView setFrame:CGRectMake(0, 0, 20, 15)];
    [leftView addGestureRecognizer:_tap_menu];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
}

- (void)navTitleConfig{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"ZCXD"];
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZCMenuTableViewCell"];

    [cell setBackgroundColor:[UIColor clearColor]];
    
    UIImage *image = [UIImage imageNamed:_arr_logo[indexPath.row]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(10, 15, 25, 20);
    [cell.contentView addSubview:imageView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = _arr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    return cell;
    
}

- (void)baseArrConfig{
    _arr = [NSArray arrayWithObjects:@"个人信息",@" 我的订单",@"设置", nil];
    _arr_logo = [NSArray arrayWithObjects:@"sz_wdxx.png",@"sz_clxx.png",@"sz_wddd.png",@"sz_sz.png", nil];
}

- (void)addZCUIView_Menu {

    //关联UIView
    NSArray *xibview = [[NSBundle mainBundle] loadNibNamed:@"ZCUIView_Menu" owner:self options:nil];

    _menu = xibview[0];
    _menu.tv.dataSource = self;
    _menu.tv.delegate = self;
    [_menu.tv setBackgroundColor:[UIColor clearColor]];
    

    NSString *username = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_name"];
    _menu.label_name.textColor = [UIColor whiteColor];
    if (self.isLogin == YES) {
        //NSLog(@"self.isLogin == YES_un=%@",username);
        _menu.label_name.text = username;
    }else{
        NSLog(@"self.isLogin == NO");
        _menu.label_name.text = @"请登录";
    }
    
    //_menu.label_name.text = username;
    _menu.label_name.textAlignment = NSTextAlignmentCenter;

    [_menu setBackgroundColor:[UIColor blackColor]];
    //self.mapView.alpha = 0.5;
    
    [self.view addSubview:_menu];
    //self.menu.frame = CGRectMake(0, 0, 200, 568);
    [_menu addGestureRecognizer:_tap_menu_left];
    if (self.isLogin == NO) {//若没登录 点击menu跳至登录页面
        [_menu addGestureRecognizer:_tap_On_imagelogo_and_labelName];
    }
    else{
        [_menu removeGestureRecognizer:_tap_On_imagelogo_and_labelName];
    }
    //[_menu.imageview_tx addGestureRecognizer:_tap_On_imagelogo_and_labelName];
    //[_menu.label_name addGestureRecognizer:_tap_On_imagelogo_and_labelName];
    
}

- (void)tapConfig{
    _tap_menu_left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tap_On_menu_left:)];
    _tap_menu_left.direction = UISwipeGestureRecognizerDirectionLeft;
    
    _tap_menu = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_On_menu:)];
    _tap_On_imagelogo_and_labelName = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_On_imagelogo_and_labelName_Click:)];
}

- (void)menuClear{
    [UIView animateWithDuration:0.3 animations:^{
        self.menu.frame = CGRectMake(-200, 0, 200, 568);
        //self.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.menu removeFromSuperview];
        self.menu = nil;
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isLogin == YES) {
        if (indexPath.row == 0) {
            
            ZCViewController_ZC_GRXX *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_ZC_GRXX"];
            vc.tag = 2;
            //vc.infoDic = self.infoDic;
            [self.navigationController pushViewController:vc animated:true];
            
            
        }else if( indexPath.row == 1){
            ZCViewController_WDDD *vc = [[ZCViewController_WDDD alloc]initWithNibName:@"ZCViewController_WDDD" bundle:nil];
            
            vc.clt_mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"clt_mail"];
            
            [self.navigationController pushViewController:vc animated:true];
            
        }else if( indexPath.row == 2){
            ZCViewController_SZ *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_SZ"];
            //vc.infoDic = self.infoDic;
            [self.navigationController pushViewController:vc animated:true];
        }
    } else {
        //[self pushViewControllerDL];
    }
}

- (void)getDataFromUserDefault{
    //NSLog(@"Root_getDataFromUserDefault");
    NSUserDefaults *userDefault = [[NSUserDefaults standardUserDefaults]init];
    NSString *status_Login = [userDefault objectForKey:@"isLogin"];
    if ([status_Login isEqualToString:@"YES"]) {
        
        //self.infoDic = [userDefault dictionaryForKey:@"infoDic"];
        //[self getInfoDicFromServer];
        self.isLogin = YES;
    }
}

- (void)getCommendArr{
    NSData *resultData = nil;
    HttpController *httpController = [[HttpController alloc]init];
    
    NSString *type = @"GET";
    
    NSString *url = [NSString stringWithFormat:@"app/clt_commend/"];
    
    NSString *info = @"nil";
    
    resultData = [httpController httpHandleWithType:type url:url info:info];
    
    self.commendArr = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    
    //NSString *resultString = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",self.commendArr);
    [self drConfig];
}

- (void)drConfig{
    [self dr1Config];
    
    [self dr2Config];
    [self dr3Config];
    [self dr4Config];
    [self dr5Config];
    [self dr6Config];
    
}

- (void)dr1Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:0];
    self.label_name_c1.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c1.text = score.stringValue;
}

- (void)dr2Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:1];
    self.label_name_c2.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c2.text = score.stringValue;
}

- (void)dr3Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:2];
    self.label_name_c3.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c3.text = score.stringValue;
}

- (void)dr4Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:3];
    self.label_name_c4.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c4.text = score.stringValue;
}

- (void)dr5Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:4];
    self.label_name_c5.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c5.text = score.stringValue;
}

- (void)dr6Config{
    NSDictionary *dic = [self.commendArr objectAtIndex:5];
    self.label_name_c6.text = [dic objectForKey:@"dr_name"];
    NSNumber *score = [dic objectForKey:@"dr_score"];
    
    self.label_score_c6.text = score.stringValue;
}

- (void)pushViewControllerDL{
    ZCViewController_DL *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_DL"];
    
    [self.navigationController pushViewController:vc animated:true];
}
@end
