//
//  ZCViewController_Date.m
//  ZCXD_S
//
//  Created by JackWee on 14-9-17.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import "ZCViewController_Date.h"

@interface ZCViewController_Date ()

@end

@implementation ZCViewController_Date

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
    [self navTitleConfig];
    //NSLog(@"Date_thsj=%@",self.time_thsj);
    //NSLog(@"Date_ddsj=%@",self.time_ddsj);
    NSLog(@"VC_DATE");
    //[self test];
    
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

- (IBAction)button_select_Click:(id)sender {
    
    NSDate *date = self.dp.date;
    
    //格式化日期时间
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm"];
     //现在日期：yyyy年MM月dd日 \n 现在时刻： HH:mm:ss             "];
    NSString * dateStr=[dateformatter stringFromDate:date];
    
    //NSLog(@"Date_dp_date:%@",dateStr);
    ZCViewController_FBDD *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController_FBDD"];
    switch (self.tag) {
        case 1:
            vc.time_thsj = dateStr;
            vc.time_ddsj = self.time_ddsj;
            
            
            
            
            break;
        case 2:
            vc.time_ddsj = dateStr;
            vc.time_thsj = self.time_thsj;
            break;
        default:
            break;
    }
    
    vc.textField_bt_ = self.textField_bt;
    vc.textField_bj_ = self.textField_bj;
    vc.textField_hpmc_ = self.textField_hpmc;
    vc.textField_zjz_ = self.textField_zjz;
    vc.textField_ydshb_ = self.textField_ydshb;
    vc.textField_ydssl_ = self.textField_ydssl;
    vc.textField_zzlwds_ = self.textField_zzlwds;
    vc.textField_cc_ = self.textField_cc;
    vc.textField_cck_ = self.textField_cck;
    vc.textField_ccg_ = self.textField_ccg;
    vc.textField_ztj_ = self.textField_ztj;
    vc.textField_nxynzhc_ = self.textField_nxynzhc;
    vc.textField_nxydclcd_ = self.textField_nxydclcd;
    vc.textField_sfxysjxz_ = self.textField_sfxysjxz;
    vc.textView_xqsm_ = self.textView_xqsm;
    vc.sc_wxp_index = self.sc_wxp_index;
    vc.sc_kdf_index = self.sc_kdf_index;
    vc.sc_zf_index = self.sc_zf_index;
    vc.sc_bx_index = self.sc_bx_index;
    
    [self.navigationController pushViewController:vc animated:true];
    
    
}

- (void)navTitleConfig{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    switch (self.tag) {
        case 1:
            [customLab setText:@"提货时间"];
            break;
        case 2:
            [customLab setText:@"到达时间"];
            break;
        default:
            break;
    }
    
    customLab.textAlignment = NSTextAlignmentCenter;
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)test{
    NSLog(@"textField_bt:%@",self.textField_bt);
    NSLog(@"textField_bj:%@",self.textField_bj);
    NSLog(@"textField_thsj:%@",self.time_thsj);
    NSLog(@"textField_ddsj:%@",self.time_ddsj);
    NSLog(@"textField_hpmc:%@",self.textField_hpmc);
    NSLog(@"textField_zjz:%@",self.textField_zjz);
    NSLog(@"textField_ydshb:%@",self.textField_ydshb);
    NSLog(@"textField_ydssl:%@",self.textField_ydssl);
    NSLog(@"textField_zzlwds:%@",self.textField_zzlwds);
    NSLog(@"textField_cc:%@",self.textField_cc);
    NSLog(@"textField_cck:%@",self.textField_cck);
    NSLog(@"textField_ccg:%@",self.textField_ccg);
    NSLog(@"textField_ztj:%@",self.textField_ztj);
    NSLog(@"textField_nxynzhc:%@",self.textField_nxynzhc);
    NSLog(@"textField_nxydclcd:%@",self.textField_nxydclcd);
    NSLog(@"sc_wxp:%d",self.sc_wxp_index);
    NSLog(@"sc_kdf:%d",self.sc_kdf_index);
    NSLog(@"sc_zf:%d",self.sc_zf_index);
    NSLog(@"sc_bx:%d",self.sc_bx_index);
    NSLog(@"textField_sfxysjxz:%@",self.textField_sfxysjxz);
    NSLog(@"textView_xqsm:%@",self.textView_xqsm);
}
@end
