//
//  ZCViewController_SJXQ.h
//  ZCXD_S
//
//  Created by JackWee on 14-9-18.
//  Copyright (c) 2014年 JackWee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCViewController_WDDD.h"

@interface ZCViewController_SJXQ : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *text_tel;
@property (strong, nonatomic) IBOutlet UITextField *text_name;
@property (strong, nonatomic) IBOutlet UITextField *text_iden;
@property (strong, nonatomic) IBOutlet UITextField *text_type;
@property (strong, nonatomic) IBOutlet UITextField *text_number;
@property (strong, nonatomic) IBOutlet UITextField *text_hand;
@property (strong, nonatomic) IBOutlet UITextField *text_length;
@property (strong, nonatomic) IBOutlet UITextField *text_weight;

@property (strong,nonatomic) NSString *dr_hand;
@property (strong,nonatomic) NSString *dr_iden;
@property (strong,nonatomic) NSString *dr_length;
@property (strong,nonatomic) NSString *dr_name;
@property (strong,nonatomic) NSString *dr_number;
@property (strong,nonatomic) NSString *dr_type;
@property (strong,nonatomic) NSString *dr_tel;
@property (strong,nonatomic) NSString *dr_weight;

- (IBAction)button_Click:(id)sender;
- (void)navTitleConfig;
- (void)textFieldConfig;
- (void)textFieldConfigWithTitle:(NSString*)title textField:(UITextField*)textField;
- (void)navItemConfig;
@end
