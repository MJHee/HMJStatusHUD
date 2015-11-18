//
//  ViewController.m
//  HMJStatusHUDDemo
//
//  Created by HeMengjie on 15/11/18.
//  Copyright © 2015年 HeMengjie. All rights reserved.
//

#import "ViewController.h"
#import "HMJStatusHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)success
{
    [HMJStatusHUD showSuccess:@"加载数据成功！"];
}
- (IBAction)fail
{
    [HMJStatusHUD showError:@"加载数据失败！"];
}
- (IBAction)load
{
    [HMJStatusHUD showLoading:@"正在加载数据...."];
}
- (IBAction)normal
{
    [HMJStatusHUD showText:@"显示普通文字"];
}
- (IBAction)hide
{
    
    [HMJStatusHUD hide];
}


@end
