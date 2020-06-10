//
//  UILabel+Insets.m
//  YCCategoryModule
//
//  Created by 刘成 on 2019/5/3.
//

#import "UILabel+Insets.h"
#import <objc/runtime.h>

@implementation UILabel (Insets)

static char kContentInsetsKey;
static char kshowContentInsetsKey;

+ (void)load
{
    [super load];
    Method fromMethod = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    Method toMethod = class_getInstanceMethod([self class], @selector(tt_drawTextInRect:));
    if (!class_addMethod([self class], @selector(drawTextInRect:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))){
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
    objc_setAssociatedObject(self, &kContentInsetsKey, NSStringFromUIEdgeInsets(contentInsets), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kshowContentInsetsKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
- (UIEdgeInsets)contentInsets
{
    return UIEdgeInsetsFromString(objc_getAssociatedObject(self, &kContentInsetsKey));
}

- (void)tt_drawTextInRect:(CGRect)rect
{
    BOOL show = objc_getAssociatedObject(self, &kshowContentInsetsKey);
    if (show) {
        rect = UIEdgeInsetsInsetRect(rect, self.contentInsets);
    }
    [self tt_drawTextInRect:rect];
}

@end
