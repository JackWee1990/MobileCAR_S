//
//  ZCViewController_BJXQ.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-17.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpController.h"
#import "ZCViewController_WDDD.h"
#import "ZCViewController.h"

@interface ZCViewController_BJXQ : UIViewController

@property (nonatomic,strong) NSString *of_id;
@property (nonatomic,strong) NSDictionary *infoDic;//存放数据
@property (strong, nonatomic) IBOutlet UITextField *textField_name;
@property (strong, nonatomic) IBOutlet UITextField *textField_tel;
@property (strong, nonatomic) IBOutlet UITextField *textField_iden;
@property (strong, nonatomic) IBOutlet UITextField *textField_number;
@property (strong, nonatomic) IBOutlet UITextField *textField_hand;
@property (strong, nonatomic) IBOutlet UITextField *textField_type;
@property (strong, nonatomic) IBOutlet UITextField *textField_length;
@property (strong, nonatomic) IBOutlet UITextField *textField_weight;
@property (strong, nonatomic) IBOutlet UITextField *textField_distance;
@property (strong, nonatomic) IBOutlet UIButton *button_submit;




-(void)getData;
- (IBAction)textField_Click:(id)sender;
- (void)textFieldConfig;
- (void)textField_name_Config;
- (void)textField_tel_Config;
- (void)textField_iden_Config;
- (void)textField_number_Config;
- (void)textField_hand_Config;
- (void)textField_type_Config;
- (void)textField_length_Config;
- (void)textField_weight_Config;
- (void)textField_distance_Config;

@end
