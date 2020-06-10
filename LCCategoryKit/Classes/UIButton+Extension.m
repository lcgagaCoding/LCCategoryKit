//
//  UIButton+Extension
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

@implementation UIButton (Extension)
@dynamic hitTestEdgeInsets;

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeCustom title:title titleColor:titleColor fontSize:fontSize bgImage:bgImage image:nil target:target action:action];
    
}

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                      image:(NSString *)image
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeCustom title:title titleColor:titleColor fontSize:fontSize bgImage:nil image:image target:target action:action];
    
}

+ (instancetype)customWithFrame:(CGRect)frame
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeCustom title:nil titleColor:nil fontSize:0 bgImage:nil image:image target:target action:action];

}

+ (instancetype)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeCustom title:title titleColor:titleColor fontSize:fontSize bgImage:nil image:nil target:target action:action];
    
}

+ (instancetype)customWithFrame:(CGRect)frame
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeCustom title:nil titleColor:nil fontSize:0 bgImage:bgImage image:nil target:target action:action];

}


+ (instancetype)systemWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
                       target:(id)target
                       action:(SEL)action{
    
    return [self buttonWithFrame:frame type:UIButtonTypeSystem title:title titleColor:titleColor fontSize:fontSize bgImage:nil image:nil target:target action:action];

}


+ (instancetype)buttonWithFrame:(CGRect)frame
                         type:(UIButtonType)type
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *) fontSize
                      bgImage:(NSString *)bgImage
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    if (title) [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (fontSize) button.titleLabel.font = fontSize;
    if (bgImage)  [button setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
    if (image)  [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark ----- 去除frame 创建方式
+ (instancetype)yc_buttonWithType:(UIButtonType)type title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *) fontSize bgImage:(UIImage *)bgImage image:(UIImage *)image target:(id)target action:(SEL)action{
    UIButton *button = [self buttonWithType:type];
    if (title) [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (fontSize) button.titleLabel.font = fontSize;
    if (bgImage)  [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    if (image)  [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//系统类型
+ (instancetype)yc_systemTextWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *)fontSize target:(id)target action:(SEL)action{
    return [self yc_buttonWithType:UIButtonTypeSystem title:title titleColor:titleColor fontSize:fontSize bgImage:nil image:nil target:target action:action];
}

//自定义类型
+ (instancetype)yc_customTextWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(UIFont *)fontSize target:(id)target  action:(SEL)action{
    return [self yc_buttonWithType:UIButtonTypeCustom title:title titleColor:titleColor fontSize:fontSize bgImage:nil image:nil target:target action:action];
}

+ (instancetype)yc_customBgImage:(UIImage *)bgImage target:(id)target action:(SEL)action{
    return [self yc_buttonWithType:UIButtonTypeCustom title:nil titleColor:nil fontSize:nil bgImage:bgImage image:nil target:target action:action];
}

+ (instancetype)yc_customImage:(UIImage *)image target:(id)target action:(SEL)action{
    return [self yc_buttonWithType:UIButtonTypeCustom title:nil titleColor:nil fontSize:nil bgImage:nil image:image target:target action:action];
}



//MARK:扩展按钮可点击范围
-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, _cmd, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) ||!self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
    
