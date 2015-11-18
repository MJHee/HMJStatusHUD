//
//  HMJStatusHUD.h
//  HMJStatusHUDDemo
//
//  Created by HeMengjie on 15/11/18.
//  Copyright © 2015年 HeMengjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMJStatusHUD : NSObject
/**
 *  显示图片和文字
 */
+ (void)showImage:(UIImage *)image andText:(NSString *)text;
/**
 *  显示图片和文字
 */
+ (void)showImageWithImageName:(NSString *)imageName andText:(NSString *)text;
/**
 *  显示成功文字
 */
+ (void)showSuccess:(NSString *)text;
/**
 *  显示失败文字
 */
+ (void)showError:(NSString *)text;
/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)text;
/**
 *  显示普通文字
 */
+ (void)showText:(NSString *)text;
/**
 *  隐藏
 */
+ (void)hide;
@end
