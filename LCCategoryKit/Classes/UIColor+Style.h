//
//  UIColor+Style.h
//  YCBaseUI
//
//  Created by 刘成 on 2019/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Style)

/**
 #108EE9,导航栏颜色,主色,按钮
 */
+ (UIColor *)yc_hex_108EE9;

/**
 #F4F4F4，背景颜色
 */
+ (UIColor *)yc_hex_F4F4F4;

/**
 #027CD4，辅助色
 */
+ (UIColor *)yc_hex_027CD4;

/**
 #EEEEEE, 分割线
 */
+ (UIColor *)yc_hex_EEEEEE;

/**
 #121D32, 一级文字,模块标题
 */
+ (UIColor *)yc_hex_121D32;

/**
 #3C3D49, 正文
 */
+ (UIColor *)yc_hex_3C3D49;

/**
 #5B6071, 二级文字
 */
+ (UIColor *)yc_hex_5B6071;

/**
 #9B9EA8, 底部标签栏文字,说明性文字
 */
+ (UIColor *)yc_hex_9B9EA8;

/**
 #B3B7C2, 默认提示文字
 */
+ (UIColor *)yc_hex_B3B7C2;

/**
 #FF3B30, 拒绝类颜色
 */
+ (UIColor *)yc_hex_FF3B30;

/**
 #F5A623, 警示颜色
 */
+ (UIColor *)yc_hex_F5A623;

/**
 #59B50A, 已完成
 */
+ (UIColor *)yc_hex_59B50A;

/**
 #FAFAFA, 辅助底色
 */
+ (UIColor *)yc_hex_FAFAFA;

/**
 #FF4D4D, 跑马灯等级红色
 */
+ (UIColor *)yc_hex_FF4D4D;

/**
 #E1F3FF，底部按钮背景色，淡蓝
 */
+ (UIColor *)yc_hex_E1F3FF;

/**
 #333333，字体颜色，黑色
 */
+ (UIColor *)yc_hex_333333;

/**
 #BBBBBB，线条颜色
 */
+ (UIColor *)yc_hex_BBBBBB;
/**
 #DDDDDD，分割线颜色
 */
+ (UIColor *)yc_hex_DDDDDD;

/**
 #FFE8B9，标签背景色
 */
+ (UIColor *)yc_hex_FFE8B9;

/**
#F5F6FA，选项背景未选中时背景色
*/
+ (UIColor *)yc_hex_F5F6FA;

/**
 进度条trackTintColor
 */
+ (UIColor *)yc_hex_F9F9F9;

+ (UIColor *)yc_hex_33A9FF ;

+ (UIColor *)yc_hex_FFB032;

+ (UIColor *)yc_hex_FF5B5B;
+ (UIColor *)yc_hex_C2EBFF;
+ (UIColor *)yc_hex_FFF7DB;
+ (UIColor *)yc_hex_FFD3DA;
+ (UIColor *)yc_hex_3F7FAC;
//+ (UIColor *)yc_hex_F5F6FA ;

+ (UIColor *)yc_hex_98D1FA;

+ (UIColor *)yc_hex_CCCCCC;

+ (UIColor *)yc_hex_CACCD4;

+ (UIColor *)yc_hex_ECEDEF;

+ (UIColor *)yc_hex_FFFFFFWithAlpha:(CGFloat)alpha;

+ (UIColor *)yc_hex_FF5A3E;

+ (UIColor *)yc_hex_FF9E08;


+ (UIColor *)yc_hex_45DBFF;
+ (UIColor *)yc_hex_A5D9FF;

+ (UIColor *)yc_hex_F8FCFF;

+ (UIColor *)yc_hex_color:(long)hexColor;

+ (UIColor *)yc_hex_000000;

+ (UIColor *)yc_hex_E8E8E8;

+ (UIColor *)yc_hex_FCFEEB;
+ (UIColor *)yc_hex_F65448;
+ (UIColor *)yc_hex_FF6C00;
+ (UIColor *)yc_hex_FF8700;

+ (UIColor *)yc_hex_1EC6FF;
+ (UIColor *)yc_hex_24A3FF;
+ (UIColor *)yc_hex_FBAD08;
+ (UIColor *)yc_hex_818181;
+ (UIColor *)yc_hex_tabbarShadow;

+ (UIColor *)yc_hex_397AE6;
+ (UIColor *)yc_hex_CFD6E1;
+ (UIColor *)yc_hex_FB900E;

+ (UIColor *)yc_hex_25C1F6 ;
+ (UIColor *)yc_hex_CFD5E5;
+ (UIColor *)yc_hex_6484BA;
+ (UIColor *)yc_hex_FFA91A;

+ (UIColor *)yc_hex_AFC3E4;

+ (UIColor *)yc_hex_92A8C2;
+ (UIColor *)yc_hex_03B2F3;

+ (UIColor *)yc_hex_FBFBFB;

+ (UIColor *)yc_hex_BDEFFF;

+ (UIColor *)yc_hex_2A3140;

/**
 生成随机颜色，前8种颜色固定

 @param count 颜色数量
 @return 所有颜色
 */
+ (NSArray *)yc_randomColor:(NSInteger)count;

+ (UIColor *)yc_hex_1EBEFF;
+ (UIColor *)yc_hex_223354 ;
+ (UIColor *)yc_hex_10B711 ;
+ (UIColor *)yc_hex_3972E9;

//银行端
+ (UIColor *)yc_hex_F8513B;
+ (UIColor *)yc_hex_333440;
+ (UIColor *)yc_hex_EFEFEF;
+ (UIColor *)yc_hex_477CBD;
+ (UIColor *)yc_hex_757B90;
+ (UIColor *)yc_hex_FF9900;
+ (UIColor *)yc_hex_F3B7C2;
+ (UIColor *)yc_hex_FE7E71;
+ (UIColor *)yc_hex_D71E06;

+ (UIColor *)yc_hex_FEFCEB;
@end

NS_ASSUME_NONNULL_END
