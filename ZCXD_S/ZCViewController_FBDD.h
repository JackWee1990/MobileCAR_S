//
//  ZCViewController_FBDD.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-9.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_Root.h"
#import "ZCViewController_Date.h"
#import "HttpController.h"

@interface ZCViewController_FBDD : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *textField_thsj;
@property (strong, nonatomic) IBOutlet UITextField *textField_ddsj;
@property (strong, nonatomic) IBOutlet UITextField *textField_hpmc;
@property (strong, nonatomic) IBOutlet UITextField *textField_zjz;
@property (strong, nonatomic) IBOutlet UITextField *textField_ydshb;
@property (strong, nonatomic) IBOutlet UITextField *textField_ydssl;
@property (strong, nonatomic) IBOutlet UITextField *textField_zzlwds;
@property (strong, nonatomic) IBOutlet UITextField *textField_cc;
@property (strong, nonatomic) IBOutlet UITextField *textField_ztj;
@property (strong, nonatomic) IBOutlet UITextField *textField_nxynzhc;
@property (strong, nonatomic) IBOutlet UITextField *textField_nxydclcd;
@property (strong, nonatomic) IBOutlet UITextField *textField_sfbhwxp;
@property (strong, nonatomic) IBOutlet UITextField *textField_hwkdf;
@property (strong, nonatomic) IBOutlet UITextField *textField_sdbzh;
@property (strong, nonatomic) IBOutlet UITextField *textField_sfxysjxz;
@property (strong, nonatomic) IBOutlet UITextField *textField_sfxygmbx;
@property (strong, nonatomic) IBOutlet UIButton *button_selectSource;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap_space;
@property (strong, nonatomic) IBOutlet UIButton *button_st;
@property (strong, nonatomic) IBOutlet UIButton *button_en;
@property (strong,nonatomic) NSString *time_thsj;
@property (strong,nonatomic) NSString *time_ddsj;
@property (strong, nonatomic) IBOutlet UITextField *textField_bt;
@property (strong, nonatomic) IBOutlet UITextField *textField_bj;
@property (strong, nonatomic) IBOutlet UITextField *textField_cck;
@property (strong, nonatomic) IBOutlet UITextField *textField_ccg;
@property (strong, nonatomic) IBOutlet UITextView *textView_xqsm;

@property (strong, nonatomic) IBOutlet UIButton *button_tsbj;
@property (strong, nonatomic) IBOutlet UIButton *button_type;
@property (strong, nonatomic) IBOutlet UIButton *button_sjxz;

@property (strong, nonatomic) IBOutlet UITableView *tv_tsbj;
@property (strong, nonatomic) IBOutlet UITableView *tv_type;
@property (strong, nonatomic) IBOutlet UITableView *tv_sjxz;

@property (nonatomic,strong) NSArray *arr_tsbj;
@property (nonatomic,strong) NSArray *arr_type;
@property (nonatomic,strong) NSArray *arr_sjxz;
@property (nonatomic,strong) NSArray *arr_typeRoadFromServer;

@property (nonatomic,assign) int tag_button;//当button_tv点击时改变其值
@property (nonatomic,strong) NSArray *arr_current;//tv dataSource

@property (strong, nonatomic) IBOutlet UISegmentedControl *sc_wxp;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sc_kdf;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sc_zf;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sc_bx;

@property (nonatomic,strong) NSString *textField_bt_;
@property (nonatomic,strong) NSString *textField_bj_;
@property (nonatomic,strong) NSString *textField_hpmc_;
@property (nonatomic,strong) NSString *textField_zjz_;
@property (nonatomic,strong) NSString *textField_ydshb_;
@property (nonatomic,strong) NSString *textField_ydssl_;
@property (nonatomic,strong) NSString *textField_zzlwds_;
@property (nonatomic,strong) NSString *textField_cc_;
@property (nonatomic,strong) NSString *textField_cck_;
@property (nonatomic,strong) NSString *textField_ccg_;
@property (nonatomic,strong) NSString *textField_ztj_;
@property (nonatomic,strong) NSString *textField_nxynzhc_;
@property (nonatomic,strong) NSString *textField_nxydclcd_;
@property (nonatomic,strong) NSString *textField_sfxysjxz_;
@property (nonatomic,strong) NSString *textView_xqsm_;
@property (nonatomic) int *sc_wxp_index;
@property (nonatomic) int *sc_kdf_index;
@property (nonatomic) int *sc_zf_index;
@property (nonatomic) int *sc_bx_index;

- (IBAction)button_tsbj_Click:(id)sender;
- (IBAction)button_type_Click:(id)sender;




- (void)textFieldConfig;
- (void)textFieldConfigWithTitle:(NSString*)title textField:(UITextField*)textField;
- (void)textFieldConfigWithRightView:(UITextField*)textField sc:(UISegmentedControl*)segmentedControl labelWidth:(double)width;

- (IBAction)button_selectSource_Click:(id)sender;
- (IBAction)tap_space_Click:(id)sender;
- (IBAction)button_sjxz_Click:(id)sender;


- (void)scrollViewConfig;
- (void)navConfig;
- (void)navItemConfig;
- (void)navTitleConfig;
- (void)arrConfig;
- (IBAction)button_st_Click:(id)sender;
- (IBAction)button_en_Click:(id)sender;
- (void)tvConfig;
- (void)getCarType;
- (void)test;


@end
