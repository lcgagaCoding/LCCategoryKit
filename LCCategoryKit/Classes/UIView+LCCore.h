//
//  UIView+LCCore.h
//  YCMerchant
//
//  Created by 刘成 on 2018/11/14.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LCCore)

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

- (void)addRoundedCorners:(UIRectCorner)corners
                    radii:(CGSize)radii
              borderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor;

/**
  默认4
 */
- (void)yc_addRadii;
@end
