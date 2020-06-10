//
//  UIView+Extension.h
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

//shenchunxing
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

#pragma mark - Border radius
/**
 *  @brief 设置圆角
 */
- (void)rounded:(CGFloat)cornerRadius;

/**
 *  @brief 设置圆角和边框
 */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**
 *  @brief 设置边框
 */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**
 * 递归获取指定类型最近的父View
 */
- (UIView *)superviewWithSuperviewClass:(Class)superviewClass;

/**
 * 淡出隐藏和淡入显示视图
 */
- (void)setFadeHidden:(BOOL)hidden;

- (void)removeAllSubviews;

/**
 抖动动画
 */
+ (void)shakeAnimationForView:(UIView *)view;

//设置圆角
- (void)lc_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner ;
- (void)lc_radiusWithRadius:(CGFloat)radius ;

@end
