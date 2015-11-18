//
//  HMJStatusHUD.m
//  HMJStatusHUDDemo
//
//  Created by HeMengjie on 15/11/18.
//  Copyright © 2015年 HeMengjie. All rights reserved.
//

#import "HMJStatusHUD.h"


static UIWindow *hmj_window;
static NSTimer *hmj_timer;
/** HUD控件的高度 */
static CGFloat const HMJWindowH = 20;
/** HUD控件的动画持续时间（出现\隐藏） */
static CGFloat const HMJAnimationDuration = 0.25;
/** HUD控件默认会停留多长时间 */
static CGFloat const HMJHUDStayDuration = 1.5;

@implementation HMJStatusHUD
/**
 *  显示图片和文字
 */
+ (void)showImage:(UIImage *)image andText:(NSString *)text
{
    //停止之前的定时器
    [hmj_timer invalidate];
    hmj_timer = nil;
    
    // 先隐藏之前的window
    hmj_window.hidden = YES;
    //创建窗口
    hmj_window = [[UIWindow alloc] init];
    hmj_window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HMJWindowH);
    hmj_window.backgroundColor = [UIColor blackColor];
    hmj_window.windowLevel = UIWindowLevelAlert;
    hmj_window.hidden = NO;
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = hmj_window.bounds;
    //按钮文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    //按钮图片
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    [hmj_window addSubview:button];
    
    //动画
    [UIView animateWithDuration:HMJAnimationDuration animations:^{
        CGRect frame = hmj_window.frame;
        frame.origin.y = 0;
        hmj_window.frame = frame;
    }];
    
    //开启新的定时器
    hmj_timer = [NSTimer scheduledTimerWithTimeInterval:HMJHUDStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
/**
 *  显示图片和文字
 */
+ (void)showImageWithImageName:(NSString *)imageName andText:(NSString *)text
{
    [self showImage:[UIImage imageNamed:imageName] andText:text];
}
/**
 *  显示成功文字
 */
+ (void)showSuccess:(NSString *)text
{
    [self showImageWithImageName:@"HMJStatusHUD.bundle/success" andText:text];
}
/**
 *  显示失败文字
 */
+ (void)showError:(NSString *)text
{
    [self showImageWithImageName:@"HMJStatusHUD.bundle/error" andText:text];
}
/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)text
{
    //停止之前的定时器
    [hmj_timer invalidate];
    hmj_timer = nil;
    
    // 先隐藏之前的window
    hmj_window.hidden = YES;
    
    //创建窗口
    hmj_window = [[UIWindow alloc] init];
    hmj_window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HMJWindowH);
    hmj_window.backgroundColor = [UIColor blackColor];
    hmj_window.windowLevel = UIWindowLevelAlert;
    hmj_window.hidden = NO;
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = hmj_window.bounds;
    //按钮文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [hmj_window addSubview:button];
    
    //圆圈
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activity startAnimating];
    activity.center = CGPointMake(button.titleLabel.frame.origin.x - 60, HMJWindowH * 0.5);
    [hmj_window addSubview:activity];
    
    //动画
    [UIView animateWithDuration:HMJAnimationDuration animations:^{
        CGRect frame = hmj_window.frame;
        frame.origin.y = 0;
        hmj_window.frame = frame;
    }];
}
/**
 *  显示普通文字
 */
+ (void)showText:(NSString *)text
{
    [self showImage:nil andText:text];
}
/**
 *  隐藏
 */
+ (void)hide
{
    //停止之前的定时器
    [hmj_timer invalidate];
    hmj_timer = nil;
    
    //退出动画
    [UIView animateWithDuration:HMJAnimationDuration animations:^{
        CGRect frame = hmj_window.frame;
        frame.origin.y = - HMJWindowH;
        hmj_window.frame = frame;
    } completion:^(BOOL finished) {
        hmj_window = nil;
    }];
}
@end
