//
//  UIColor+Style.m
//  LCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#import "UIColor+Style.h"

#define LCColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define LCColorFromRGBAlpha(rgbValue,a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:a]

@implementation UIColor (Style)

/**
 #EEEEEE, 分割线
 */
+ (UIColor *)lc_hex_EEEEEE{
    return LCColorFromRGB(0xEEEEEE);
}

    
@end
