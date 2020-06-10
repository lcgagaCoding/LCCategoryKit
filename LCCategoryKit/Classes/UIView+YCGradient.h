//
//  UIView+ycGradient.h
//  ycCategoryModule
//
//  Created by 刘成 on 2019/5/3.
//

#import <UIKit/UIKit.h>

@interface UIView (YCGradient)

@property(nullable, copy) NSArray *yc_colors;
@property(nullable, copy) NSArray<NSNumber *> *yc_locations;
@property CGPoint yc_startPoint;
@property CGPoint yc_endPoint;

//渐变初始化
+ (UIView *_Nullable)yc_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


/**
 设置渐变色

 @param colors 渐变色数组
 @param locations 位置
 @param startPoint 开始渐变位置
 @param endPoint 结束渐变位置
 */
- (void)yc_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

//设置y方向的渐变
- (void)yc_setYDirectionGradientWithColors:(NSArray<UIColor *> *)colors;

@end
