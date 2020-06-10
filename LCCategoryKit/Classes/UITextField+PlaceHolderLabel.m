//
//  UITextField+PlaceHolderLabel.m
//  LCCategoryModule
//
//  Created by 刘成 on 2019/9/23.
//

#import "UITextField+PlaceHolderLabel.h"
#import "UIColor+Style.h"
#import "UIFont+Style.h"
#import <objc/runtime.h>

@implementation UITextField (PlaceHolderLabel)

//- (void)setPlaceHolderLabel:(UIColor *)textColor font:(UIFont *)font {
//    [self placeHolderLabel].textColor = textColor;
//    [self placeHolderLabel].font = font;
//}
//
//- (void)setPlaceHolderColor:(UIColor *)textColor {
//    [self placeHolderLabel].textColor = textColor;
//}
//- (void)setPlaceHolderFont:(UIFont *)font {
//    [self placeHolderLabel].font = font;
//}
//
//- (UILabel *)placeHolderLabel {
//   Ivar ivar =  class_getInstanceVariable([self class], "_placeholderLabel");
//    return object_getIvar(self, ivar);
//}

- (void)setPlaceHolder:(NSString *)placeHolder font:(UIFont *)font {
    [self setPlaceHolder:placeHolder color:nil font:font];
}
- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)color {
    [self setPlaceHolder:placeHolder color:color font:nil];
}

- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor * _Nullable)color font:(UIFont * _Nullable)font {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    if (!placeHolder) {
        return;
    }
    
    if (color) {
        dic[NSForegroundColorAttributeName] = color;
    }
    if (font) {
        dic[NSFontAttributeName] = font;
    }
    if (dic.count > 0) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolder attributes:dic];
    }else {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolder];
    }
}

@end
