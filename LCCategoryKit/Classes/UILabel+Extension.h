//
//  UILabel+LCCreate.h
//  SmallDetective
//
//  Created by 刘成 on 17/4/19.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor;

//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;


+ (id)labelWithFrame:(CGRect)frame text:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor;


#pragma mark ---- 去除frame快速创建

/**
 基础创建
 */
+ (UILabel *)yc_labelWithText:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor;

/**
 不设置背景色、默认居左
 */
+ (UILabel *)yc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor;

/**
 无背景色、可设置行数
 */
+ (UILabel *)yc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

/**
 无背景色
 */
+ (UILabel *)yc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;


/**
 设置label内容左右对齐

 @param labelWidth label宽度
 */
- (void)yc_textAlignmentLeftAndRight:(CGFloat)labelWidth;
@end
