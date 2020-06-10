//
//  UIColor+Style.m
//  YCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#import "UIColor+Style.h"

#define YCColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define YCColorFromRGBAlpha(rgbValue,a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:a]

@implementation UIColor (Style)



+ (UIColor *)yc_hex_108EE9 {
    return YCColorFromRGB(0x108EE9);
}

+ (UIColor *)yc_hex_F4F4F4 {
    return YCColorFromRGB(0xF4F4F4);
}

+ (UIColor *)yc_hex_027CD4{
    return YCColorFromRGB(0x027CD4);
}

+ (UIColor *)yc_hex_EEEEEE{
    return YCColorFromRGB(0xEEEEEE);
}

+ (UIColor *)yc_hex_121D32{
    return YCColorFromRGB(0x121D32);
}

+ (UIColor *)yc_hex_3C3D49{
    return YCColorFromRGB(0x3C3D49);
}

+ (UIColor *)yc_hex_5B6071{
    return YCColorFromRGB(0x5B6071);
}

+ (UIColor *)yc_hex_9B9EA8{
    return YCColorFromRGB(0x9B9EA8);
}

+ (UIColor *)yc_hex_B3B7C2{
    return YCColorFromRGB(0xB3B7C2);
}

+ (UIColor *)yc_hex_FF3B30{
    return YCColorFromRGB(0xFF3B30);
}

+ (UIColor *)yc_hex_F5A623{
    return YCColorFromRGB(0xF5A623);
}

+ (UIColor *)yc_hex_59B50A{
    return YCColorFromRGB(0X59B50A);
}

+ (UIColor *)yc_hex_FAFAFA{
    return YCColorFromRGB(0xFAFAFA);
}

+ (UIColor *)yc_hex_FF4D4D{
    return YCColorFromRGB(0xFF4D4D);
}

+ (UIColor *)yc_hex_E1F3FF {
    return YCColorFromRGB(0xE1F3FF);
}

+ (UIColor *)yc_hex_333333 {
    return YCColorFromRGB(0x333333);
}

+ (UIColor *)yc_hex_BBBBBB {
    return YCColorFromRGB(0xBBBBBB);
}

+ (UIColor *)yc_hex_DDDDDD {
    return YCColorFromRGB(0xDDDDDD);
}

+ (UIColor *)yc_hex_FFE8B9 {
    return YCColorFromRGB(0xFFE8B9);
}

+ (UIColor *)yc_hex_F5F6FA {
    return YCColorFromRGB(0xF5F6FA);
}

+ (UIColor *)yc_hex_F9F9F9 {
    return YCColorFromRGB(0xF9F9F9);
}

+ (UIColor *)yc_hex_33A9FF {
    return YCColorFromRGB(0x33A9FF);
}

+ (UIColor *)yc_hex_FFB032 {
    return YCColorFromRGB(0xFFB032);
}

+ (UIColor *)yc_hex_FF5B5B {
    return YCColorFromRGB(0xFF5B5B);
}

+ (UIColor *)yc_hex_C2EBFF {
    return YCColorFromRGB(0xC2EBFF);
}

+ (UIColor *)yc_hex_FFF7DB {
    return YCColorFromRGB(0xFFF7DB);
}

+ (UIColor *)yc_hex_FFD3DA {
    return YCColorFromRGB(0xFFD3DA);
}

+ (UIColor *)yc_hex_3F7FAC {
    return YCColorFromRGB(0x3F7FAC);
}
//+ (UIColor *)yc_hex_F5F6FA {
//    return YCColorFromRGB(0xF5F6FA);
//}

+ (UIColor *)yc_hex_98D1FA {
    return YCColorFromRGB(0x98D1FA);
}

+ (UIColor *)yc_hex_CCCCCC {
    return YCColorFromRGB(0xCCCCCC);
}

+ (UIColor *)yc_hex_CACCD4 {
    return YCColorFromRGB(0xCACCD4);
}

+ (UIColor *)yc_hex_ECEDEF {
    return YCColorFromRGB(0xECEDEF);
}

+ (UIColor *)yc_hex_FFFFFFWithAlpha:(CGFloat)alpha
{
    return  YCColorFromRGBAlpha(0xFFFFFF,alpha);
}

+ (UIColor *)yc_hex_FF5A3E
{
    return YCColorFromRGB(0xFF5A3E);
}

+ (UIColor *)yc_hex_FF9E08
{
    return YCColorFromRGB(0xFF9E08);
}

+ (UIColor *)yc_hex_45DBFF {
    return YCColorFromRGB(0x45DBFF);
}
+ (UIColor *)yc_hex_A5D9FF {
    return YCColorFromRGB(0xA5D9FF);
}

+ (UIColor *)yc_hex_F8FCFF {
    return YCColorFromRGB(0xF8FCFF);
}

+ (UIColor *)yc_hex_color:(long)hexColor {
    return YCColorFromRGB(hexColor);
}

+ (UIColor *)yc_hex_000000{
    return YCColorFromRGB(0x000000);
}

+ (UIColor *)yc_hex_E8E8E8{
    return YCColorFromRGB(0xE8E8E8);
}

+ (UIColor *)yc_hex_FCFEEB{
    return YCColorFromRGB(0xFCFEEB);
}

+ (UIColor *)yc_hex_F65448{
    return YCColorFromRGB(0xF65448);
}

+ (UIColor *)yc_hex_FF6C00{
    return YCColorFromRGB(0xFF6C00);
}

+ (UIColor *)yc_hex_FF8700{
    return YCColorFromRGB(0xFF8700);
}

+ (UIColor *)yc_hex_1EC6FF
{
     return YCColorFromRGB(0x1EC6FF);
}

+ (UIColor *)yc_hex_24A3FF
{
    return YCColorFromRGB(0x24A3FF);
}

+ (UIColor *)yc_hex_FBAD08
{
    return YCColorFromRGB(0xFBAD08);
}
+ (UIColor *)yc_hex_818181{
    return YCColorFromRGB(0x818181);
}

+ (UIColor *)yc_hex_tabbarShadow{
    return YCColorFromRGBAlpha(0x000000, 0.04);
}

+ (UIColor *)yc_hex_397AE6 {
    return YCColorFromRGB(0x397AE6);
}
+ (UIColor *)yc_hex_CFD6E1 {
    return YCColorFromRGB(0xCFD6E1);
}

+ (UIColor *)yc_hex_FB900E {
    return YCColorFromRGB(0xFB900E);
}
+ (UIColor *)yc_hex_25C1F6 {
    return YCColorFromRGB(0x25C1F6);
}

+ (UIColor *)yc_hex_CFD5E5{
    return YCColorFromRGB(0xCFD5E5);
}

+ (UIColor *)yc_hex_6484BA{
    return YCColorFromRGB(0x6484BA);
}

+ (UIColor *)yc_hex_FFA91A{
    return YCColorFromRGB(0xFFA91A);
}

+ (UIColor *)yc_hex_AFC3E4{
    return YCColorFromRGB(0xAFC3E4);
}

+ (UIColor *)yc_hex_92A8C2{
    return YCColorFromRGB(0x92A8C2);
}

+ (UIColor *)yc_hex_03B2F3{
    return YCColorFromRGB(0x03B2F3);
}

+ (UIColor *)yc_hex_FBFBFB{
    return YCColorFromRGB(0xFBFBFB);
}

+ (UIColor *)yc_hex_BDEFFF{
    return YCColorFromRGB(0xBDEFFF);
}

+ (UIColor *)yc_hex_2A3140{
    return YCColorFromRGB(0x2A3140);
}
+ (NSArray *)yc_randomColor:(NSInteger)count {
    
    NSMutableArray *myColors = [NSMutableArray array];
    [myColors addObject:YCColorFromRGB(0xF3EB6A)];
    [myColors addObject:YCColorFromRGB(0xBCD35B)];
    [myColors addObject:YCColorFromRGB(0x4CB25D)];
    [myColors addObject:YCColorFromRGB(0x49CFEB)];
    [myColors addObject:YCColorFromRGB(0x4387D3)];
    [myColors addObject:YCColorFromRGB(0x9642F7)];
    [myColors addObject:YCColorFromRGB(0x108EE9)];
    [myColors addObject:YCColorFromRGB(0xF1B04D)];
    
    int startColor = 0xdddddd;
    int endColor = 0xff111111;
    int step = (startColor-endColor)/(count+9);
    int hexValue;
    for (NSInteger i = count-1; i>=0; i--) {
        hexValue = 0xff000000 | (int)(endColor+step*i);
        
        UIColor *resultColor = [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f];
        
        [myColors addObject:resultColor];
    }
    return myColors;
}


+ (UIColor *)yc_hex_1EBEFF
{
    return YCColorFromRGB(0x1EBEFF);
}

+ (UIColor *)yc_hex_223354 {
    return YCColorFromRGB(0x223354);
}

+ (UIColor *)yc_hex_10B711 {
    return YCColorFromRGB(0x10B711);
}

+ (UIColor *)yc_hex_3972E9 {
   return YCColorFromRGB(0x3972E9);
}

#pragma mark - 银行端
+ (UIColor *)yc_hex_F8513B {
  return YCColorFromRGB(0xF8513B);
}

+ (UIColor *)yc_hex_333440 {
    return YCColorFromRGB(0x333440);
}

+ (UIColor *)yc_hex_EFEFEF {
    return YCColorFromRGB(0xEFEFEF);
}

+ (UIColor *)yc_hex_477CBD {
    return YCColorFromRGB(0x477CBD);
}

+ (UIColor *)yc_hex_757B90 {
   return YCColorFromRGB(0x757B90);
}

+ (UIColor *)yc_hex_FF9900 {
   return YCColorFromRGB(0xFF9900);
}

+ (UIColor *)yc_hex_F3B7C2 {
   return YCColorFromRGB(0xF3B7C2);
}

+ (UIColor *)yc_hex_FE7E71 {
   return YCColorFromRGB(0xFE7E71);
}

+ (UIColor *)yc_hex_D71E06 {
  return YCColorFromRGB(0xD71E06);
}

+ (UIColor *)yc_hex_FEFCEB {
  return YCColorFromRGB(0xFEFCEB);
}

    
@end
