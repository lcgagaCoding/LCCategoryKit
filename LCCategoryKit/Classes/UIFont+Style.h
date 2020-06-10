//
//  UIFont+Style.h
//  YCBaseUI
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
+ (UIFont *)yc_title_font;

/**
 主要文字、列表文字、按钮文字，15号
 
 @return 默认15号
 */
+ (UIFont *)yc_major_font;

/**
 主要文字、列表文字、按钮文字，加粗，15号
 
 @return 默认15号
 */
+ (UIFont *)yc_major_bold_font;

/**
 辅助说明文字、搜索框文字，13号
 
 @return 默认13号
 */
+ (UIFont *)yc_minor_font;

/**
 辅助说明文字、搜索框文字，加粗，13号
 
 @return 默认13号
 */
+ (UIFont *)yc_minor_bold_font;

/**
 注释文字、提示文字，12号
 
 @return 默认12号
 */
+ (UIFont *)yc_comment_font;

/**
 少数的备注说明信息，11号
 
 @return 默认11号
 */
+ (UIFont *)yc_describ_font;

/**
 极少数的备注说明信息，10号
 
 @return 默认10号
 */
+ (UIFont *)yc_tiny_describ_font;

+ (UIFont *)yc_18;

+ (UIFont *)yc_18_bold;

+ (UIFont *)yc_17;

+ (UIFont *)yc_17_bold;

+ (UIFont *)yc_15;

+ (UIFont *)yc_14;
+ (UIFont *)yc_14_bold;
+ (UIFont *)yc_14_thin;

+ (UIFont *)yc_15_bold;

+ (UIFont *)yc_16;

+ (UIFont *)yc_16_bold;

+ (UIFont *)yc_16_thin;

+ (UIFont *)yc_13;

+ (UIFont *)yc_13_bold;

+ (UIFont *)yc_12;

+ (UIFont *)yc_11;
+ (UIFont *)yc_11_thin;

+ (UIFont *)yc_10;

+ (UIFont *)yc_9;

+ (UIFont *)yc_20;

+ (UIFont *)yc_20_bold;

+ (UIFont *)yc_26_bold;
+ (UIFont *)yc_24_bold;

+ (UIFont *)yc_36_bold;
+ (UIFont *)yc_22_bold;
+ (UIFont *)yc_28_din_bold;
+ (UIFont *)yc_13_thin ;
@end

NS_ASSUME_NONNULL_END
