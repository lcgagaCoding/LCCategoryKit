//
//  UITextField+PlaceHolderLabel.h
//  YCCategoryModule
//
//  Created by 刘成 on 2019/9/23.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (PlaceHolderLabel)

//- (void)setPlaceHolderLabel:(UIColor *)textColor font:(UIFont *)font;
//- (void)setPlaceHolderColor:(UIColor *)textColor;
//- (void)setPlaceHolderFont:(UIFont *)font;

- (void)setPlaceHolder:(NSString *)placeHolder font:(UIFont *)font;
- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)color;
- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor * _Nullable)color font:(UIFont * _Nullable)font;

@end

NS_ASSUME_NONNULL_END
