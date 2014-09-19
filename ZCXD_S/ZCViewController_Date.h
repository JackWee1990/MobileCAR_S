//
//  ZCViewController_Date.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-17.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_FBDD.h"
@interface ZCViewController_Date : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *dp;
@property (strong, nonatomic) IBOutlet UIButton *button_select;
@property (nonatomic,assign) int tag;//提货时间——1 到达时间——2
@property (nonatomic,strong) NSString *time_thsj;
@property (nonatomic,strong) NSString *time_ddsj;

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
@property (nonatomic) int *sc_wxp_index;
@property (nonatomic) int *sc_kdf_index;
@property (nonatomic) int *sc_zf_index;
@property (nonatomic) int *sc_bx_index;



- (IBAction)button_select_Click:(id)sender;

- (void)test;
@end
