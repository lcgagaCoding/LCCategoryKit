//
//  UIView+Extension.m
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


#pragma mark ------ top、left、bottom、right
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y+self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x+self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


#pragma mark - Border radius

/**
 *  @brief 设置圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)rounded:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

/**
 *  @brief 设置圆角和边框
 *
 *  @param cornerRadius 圆角半径
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}

/**
 *  @brief 设置边框
 *
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}


/**
 * 递归获取指定类型最近的父View
 */
- (UIView *)superviewWithSuperviewClass:(Class)superviewClass {
    UIView *aSuperView = [self superview];
    while (true) {
        if (! aSuperView) {
            return nil;
        }
        if ([aSuperView isKindOfClass:superviewClass]) {
            return aSuperView;
        }
        aSuperView = [aSuperView superview];
    }
}

/**
 * 淡出隐藏和淡入显示视图
 */
- (void)setFadeHidden:(BOOL)hidden {
    
    if (hidden) { //隐藏
        self.alpha= 1.0f;
        [UIView beginAnimations:@"FADE_OUT_HIDDEN" context:nil];
        [UIView setAnimationDuration:0.5];
        //[UIView setAnimationDelegate:self];//设置委托
        [UIView setAnimationDidStopSelector:@selector(fadeOutHiddenAnimationStop)];//当动画结束时，我们还需要再将其隐藏
        self.alpha = 0.0f;
        [UIView commitAnimations];
    } else if (! hidden) { //显示
        self.alpha= 0.0f;
        self.hidden = NO;
        [UIView beginAnimations:@"FADE_IN_SHOW" context:nil];
        [UIView setAnimationDuration:0.5];
        self.alpha= 1.0f;
        [UIView commitAnimations];
    }
}

//淡出隐藏动画回调
- (void)fadeOutHiddenAnimationStop {
    self.hidden = YES;
}


- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

//抖动动画
+ (void)shakeAnimationForView:(UIView *)view{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    [viewLayer addAnimation:animation forKey:nil];
}


- (void)yc_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner {
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
           CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
           maskLayer.frame = self.bounds;
           maskLayer.path = path.CGPath;
           self.layer.mask = maskLayer;
    });
}

- (void)yc_radiusWithRadius:(CGFloat)radius {
    [self yc_radiusWithRadius:radius corner:UIRectCornerAllCorners];
}

@end
