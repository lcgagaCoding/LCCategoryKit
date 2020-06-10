//
//  UILabel+LCCreate.m
//  SmallDetective
//
//  Created by 刘成 on 17/4/19.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "UILabel+Extension.h"
#import <objc/runtime.h>

@implementation UILabel (Extension)



//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor
{
   return [UILabel labelWithFrame:frame text:text textFont:textFont textColor:textColor textAlignment:NSTextAlignmentLeft numberOfLines:0 backgroundColor:nil];
    
}

//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment
{
   return [UILabel labelWithFrame:frame text:text textFont:textFont textColor:textColor textAlignment:textAlignment numberOfLines:0 backgroundColor:nil];
}

//添加快速创建的方法
+(id)labelWithFrame:(CGRect)frame
               text:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    return [UILabel labelWithFrame:frame text:text textFont:textFont textColor:textColor textAlignment:textAlignment numberOfLines:numberOfLines backgroundColor:nil];
}

+ (id)labelWithFrame:(CGRect)frame text:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (text) label.text = [NSString stringWithFormat:@"%@",text];
    if (textColor) label.textColor = textColor;
    if (textAlignment) label.textAlignment = textAlignment;
    if (font) label.font = font;
    label.numberOfLines = numberOfLines?:0;
    if (backgroundColor) label.backgroundColor = backgroundColor;
    
    return label;
}


#pragma mark ------- 去除frame

+ (UILabel *)lc_labelWithText:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor{
    UILabel *label = [[UILabel alloc] init];
    if (text) label.text = [NSString stringWithFormat:@"%@",text];
    if (textColor) label.textColor = textColor;
    if (textAlignment) label.textAlignment = textAlignment;
    if (font) label.font = font;
    if (numberOfLines) label.numberOfLines = numberOfLines;
    if (backgroundColor) label.backgroundColor = backgroundColor;
    
    return label;
}

//添加快速创建的方法
+ (UILabel *)lc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment
{
    return [UILabel lc_labelWithText:text textFont:textFont textColor:textColor textAlignment:textAlignment numberOfLines:0 backgroundColor:nil];
}

//添加快速创建的方法
+(UILabel *)lc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    return [UILabel lc_labelWithText:text textFont:textFont textColor:textColor textAlignment:textAlignment numberOfLines:numberOfLines backgroundColor:nil];
}

//添加快速创建的方法
+(UILabel *)lc_labelWithText:(NSString *)text textFont:(UIFont *)textFont textColor:(UIColor *)textColor
{
    return [UILabel lc_labelWithText:text textFont:textFont textColor:textColor textAlignment:NSTextAlignmentLeft numberOfLines:0 backgroundColor:nil];
    
}

- (void)lc_textAlignmentLeftAndRight:(CGFloat)labelWidth {
    
    if (self.text == nil || self.text.length == 0) {
        return;
    }
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size;
    NSInteger length = (self.text.length-1);
    CGFloat margin = (labelWidth - size.width)/length;
    NSNumber*number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0,length)];
    self.attributedText= attribute;
}
@end
