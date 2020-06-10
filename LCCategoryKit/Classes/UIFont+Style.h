//
//  UIFont+Style.h
//  LCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Style)


/**
 主标题文字，17号
 
 @return 默认17号
 */
+ (UIFont *)lc_title_font;

/**
 主要文字、列表文字、按钮文字，15号
 
 @return 默认15号
 */
+ (UIFont *)lc_major_font;

/**
 主要文字、列表文字、按钮文字，加粗，15号
 
 @return 默认15号
 */
+ (UIFont *)lc_major_bold_font;

/**
 辅助说明文字、搜索框文字，13号
 
 @return 默认13号
 */
+ (UIFont *)lc_minor_font;

/**
 辅助说明文字、搜索框文字，加粗，13号
 
 @return 默认13号
 */
+ (UIFont *)lc_minor_bold_font;

/**
 注释文字、提示文字，12号
 
 @return 默认12号
 */
+ (UIFont *)lc_comment_font;

/**
 少数的备注说明信息，11号
 
 @return 默认11号
 */
+ (UIFont *)lc_describ_font;

/**
 极少数的备注说明信息，10号
 
 @return 默认10号
 */
+ (UIFont *)lc_tiny_describ_font;

+ (UIFont *)lc_18;

+ (UIFont *)lc_18_bold;

+ (UIFont *)lc_17;

+ (UIFont *)lc_17_bold;

+ (UIFont *)lc_15;

+ (UIFont *)lc_14;
+ (UIFont *)lc_14_bold;
+ (UIFont *)lc_14_thin;

+ (UIFont *)lc_15_bold;

+ (UIFont *)lc_16;

+ (UIFont *)lc_16_bold;

+ (UIFont *)lc_16_thin;

+ (UIFont *)lc_13;

+ (UIFont *)lc_13_bold;

+ (UIFont *)lc_12;

+ (UIFont *)lc_11;
+ (UIFont *)lc_11_thin;

+ (UIFont *)lc_10;

+ (UIFont *)lc_9;

+ (UIFont *)lc_20;

+ (UIFont *)lc_20_bold;

+ (UIFont *)lc_13_thin ;
@end

NS_ASSUME_NONNULL_END
