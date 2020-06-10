//
//  UIFont+Style.m
//  LCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#define lc_fontName_regular @"PingFangSC-Regular"
#define lc_fontName_medium @"PingFangSC-Medium"
#define lc_fontName_light @"PingFangSC-Light"

#import "UIFont+Style.h"

@implementation UIFont (Style)

+ (UIFont *)lc_title_font {
    return [UIFont lc_17_bold];
}

+ (UIFont *)lc_major_font {
    return [UIFont lc_15];
}

+ (UIFont *)lc_major_bold_font {
    return [UIFont lc_15_bold];
}

+ (UIFont *)lc_minor_font {
    return [UIFont lc_13];
}

+ (UIFont *)lc_minor_bold_font {
    return [UIFont lc_13_bold];
}

+ (UIFont *)lc_comment_font {
    return [UIFont lc_12];
}

+ (UIFont *)lc_describ_font {
    return [UIFont lc_11];
}

+ (UIFont *)lc_tiny_describ_font {
    return [UIFont lc_10];
}

+ (UIFont *)lc_18 {
    return [UIFont fontWithName:lc_fontName_regular size:18];
}

+ (UIFont *)lc_18_bold {
    return [UIFont fontWithName:lc_fontName_medium size:18];
}

+ (UIFont *)lc_17 {
    return [UIFont fontWithName:lc_fontName_regular size:17];
}

+ (UIFont *)lc_17_bold {
    return [UIFont fontWithName:lc_fontName_medium size:17];
}

+ (UIFont *)lc_15 {
    return [UIFont fontWithName:lc_fontName_regular size:15];
}

+ (UIFont *)lc_14 {
    return [UIFont fontWithName:lc_fontName_regular size:14];
}

+ (UIFont *)lc_14_bold {
    return [UIFont fontWithName:lc_fontName_medium size:14];
}

+ (UIFont *)lc_14_thin {
    return [UIFont fontWithName:lc_fontName_light size:14];
}

+ (UIFont *)lc_16 {
    return [UIFont fontWithName:lc_fontName_regular size:16];
}

+ (UIFont *)lc_16_bold {
    return [UIFont fontWithName:lc_fontName_medium size:16];
}

+ (UIFont *)lc_16_thin {
    return [UIFont fontWithName:lc_fontName_light size:16];
}


+ (UIFont *)lc_15_bold {
    return [UIFont fontWithName:lc_fontName_medium size:15];
}

+ (UIFont *)lc_13 {
    return [UIFont fontWithName:lc_fontName_regular size:13];
}

+ (UIFont *)lc_13_bold {
    return [UIFont fontWithName:lc_fontName_medium size:13];
}

+ (UIFont *)lc_12 {
    return [UIFont fontWithName:lc_fontName_regular size:12];
}

+ (UIFont *)lc_11 {
    return [UIFont fontWithName:lc_fontName_regular size:11];
}

+ (UIFont *)lc_11_thin {
    return [UIFont fontWithName:lc_fontName_light size:11];
}

+ (UIFont *)lc_10 {
    return [UIFont fontWithName:lc_fontName_regular size:10];
}

+ (UIFont *)lc_9 {
    return [UIFont fontWithName:lc_fontName_regular size:9];
}


+ (UIFont *)lc_20 {
    return [UIFont fontWithName:lc_fontName_regular size:20];
}

+ (UIFont *)lc_20_bold {
    return [UIFont fontWithName:lc_fontName_medium size:20];
}

+ (UIFont *)lc_13_thin {
   return [UIFont fontWithName:lc_fontName_light size:13];
}

@end
