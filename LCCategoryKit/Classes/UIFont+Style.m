//
//  UIFont+Style.m
//  YCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#define yc_fontName_regular @"PingFangSC-Regular"
#define yc_fontName_medium @"PingFangSC-Medium"
#define yc_fontName_light @"PingFangSC-Light"
#define yc_fontName_DIN_Bold @"DINAlternate-Bold"

#import "UIFont+Style.h"

@implementation UIFont (Style)

+ (UIFont *)yc_title_font {
    return [UIFont yc_17_bold];
}

+ (UIFont *)yc_major_font {
    return [UIFont yc_15];
}

+ (UIFont *)yc_major_bold_font {
    return [UIFont yc_15_bold];
}

+ (UIFont *)yc_minor_font {
    return [UIFont yc_13];
}

+ (UIFont *)yc_minor_bold_font {
    return [UIFont yc_13_bold];
}

+ (UIFont *)yc_comment_font {
    return [UIFont yc_12];
}

+ (UIFont *)yc_describ_font {
    return [UIFont yc_11];
}

+ (UIFont *)yc_tiny_describ_font {
    return [UIFont yc_10];
}

+ (UIFont *)yc_18 {
    return [UIFont fontWithName:yc_fontName_regular size:18];
}

+ (UIFont *)yc_18_bold {
    return [UIFont fontWithName:yc_fontName_medium size:18];
}

+ (UIFont *)yc_17 {
    return [UIFont fontWithName:yc_fontName_regular size:17];
}

+ (UIFont *)yc_17_bold {
    return [UIFont fontWithName:yc_fontName_medium size:17];
}

+ (UIFont *)yc_15 {
    return [UIFont fontWithName:yc_fontName_regular size:15];
}

+ (UIFont *)yc_14 {
    return [UIFont fontWithName:yc_fontName_regular size:14];
}

+ (UIFont *)yc_14_bold {
    return [UIFont fontWithName:yc_fontName_medium size:14];
}

+ (UIFont *)yc_14_thin {
    return [UIFont fontWithName:yc_fontName_light size:14];
}

+ (UIFont *)yc_16 {
    return [UIFont fontWithName:yc_fontName_regular size:16];
}

+ (UIFont *)yc_16_bold {
    return [UIFont fontWithName:yc_fontName_medium size:16];
}

+ (UIFont *)yc_16_thin {
    return [UIFont fontWithName:yc_fontName_light size:16];
}


+ (UIFont *)yc_15_bold {
    return [UIFont fontWithName:yc_fontName_medium size:15];
}

+ (UIFont *)yc_13 {
    return [UIFont fontWithName:yc_fontName_regular size:13];
}

+ (UIFont *)yc_13_bold {
    return [UIFont fontWithName:yc_fontName_medium size:13];
}

+ (UIFont *)yc_12 {
    return [UIFont fontWithName:yc_fontName_regular size:12];
}

+ (UIFont *)yc_11 {
    return [UIFont fontWithName:yc_fontName_regular size:11];
}

+ (UIFont *)yc_11_thin {
    return [UIFont fontWithName:yc_fontName_light size:11];
}

+ (UIFont *)yc_10 {
    return [UIFont fontWithName:yc_fontName_regular size:10];
}

+ (UIFont *)yc_9 {
    return [UIFont fontWithName:yc_fontName_regular size:9];
}


+ (UIFont *)yc_20 {
    return [UIFont fontWithName:yc_fontName_regular size:20];
}

+ (UIFont *)yc_20_bold {
    return [UIFont fontWithName:yc_fontName_medium size:20];
}

+ (UIFont *)yc_26_bold
{
    return [UIFont fontWithName:yc_fontName_DIN_Bold size:26];
}

+ (UIFont *)yc_24_bold
{
    return [UIFont fontWithName:yc_fontName_DIN_Bold size:24];
}


+ (UIFont *)yc_36_bold {
   return [UIFont fontWithName:yc_fontName_DIN_Bold size:36];
}

+ (UIFont *)yc_22_bold {
    return [UIFont fontWithName:yc_fontName_medium size:22];
}

+ (UIFont *)yc_28_din_bold {
    return [UIFont fontWithName:yc_fontName_DIN_Bold size:28];
}

+ (UIFont *)yc_13_thin {
   return [UIFont fontWithName:yc_fontName_light size:13];
}

@end
