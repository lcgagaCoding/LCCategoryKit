//
//  UIButton+Extension.h
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)customWithFrame:(CGRect)frame
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)customWithFrame:(CGRect)frame
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)systemWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                       target:(id)target
                       action:(SEL)action;

#pragma mark --------- button初始化

/// 全能初始化
/// @param type 按钮类型
/// @param title 标题
/// @param titleColor 标题颜色
/// @param fontSize 标题大小
/// @param bgImage 背景图
/// @param image 图片
/// @param target 目标
/// @param action 事件    
+ (instancetype)lc_buttonWithType:(UIButtonType)type title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *) fontSize bgImage:(UIImage *)bgImage image:(UIImage *)image target:(id)target action:(SEL)action;

/// 系统类型的文字按钮
/// @param title 标题
/// @param titleColor 标题颜色
/// @param fontSize 标题大小
/// @param target 目标
/// @param action 事件
+ (instancetype)lc_systemTextWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *)fontSize target:(id)target action:(SEL)action;

/// 自定义类型的文字按钮
/// @param title 标题
/// @param titleColor 标题颜色
/// @param fontSize 标题大小
/// @param target target
/// @param action action
+ (instancetype)lc_customTextWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *)fontSize target:(id)target action:(SEL)action;

/// 单独设置背景图片作为按钮
/// @param bgImage 背景图片
/// @param target target
/// @param action action
+ (instancetype)lc_customBgImage:(UIImage *)bgImage target:(id)target action:(SEL)action;

/// 单独图片作为按钮
/// @param image image
/// @param target target
/// @param action action
+ (instancetype)lc_customImage:(UIImage *)image target:(id)target action:(SEL)action;

//按钮可点击范围
@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;
@end
