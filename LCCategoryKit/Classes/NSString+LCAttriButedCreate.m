//
//  NSString+LCAttriButedCreate.m
//  LCSaas
//
//  Created by 刘成 on 2018/5/29.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "NSString+LCAttriButedCreate.h"

@implementation NSString (LCAttriButedCreate)
- (NSMutableAttributedString *)attributedWithTextColor:(UIColor*)color{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
    [attri addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [self length])];
    return attri;
}
- (NSMutableAttributedString *)attributedWithTextColor:(UIColor*)color range:(NSRange)range{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
    [attri addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attri;
}

- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
    [attri addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [self length])];
    return attri;
}
- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font range:(NSRange)range{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
    [attri addAttribute:NSFontAttributeName value:font range:range];
    return attri;
}
- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font textColor:(UIColor*)color range:(NSRange)range{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
//    if (range.location+range.length>=self.length) return attri;
    if (range.location+range.length>self.length) return attri;
    [attri addAttribute:NSFontAttributeName value:font range:range];
    [attri addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attri;
}

- (NSMutableAttributedString *)attributedWithTextFonts:(NSArray <UIFont *>*)fonts textColors:(NSArray <UIColor *>*)colors ranges:(NSArray <NSString *>*)ranges{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self];
    if (fonts.count==colors.count && fonts.count==ranges.count) {
        for (int i=0; i<fonts.count; i++) {
            UIFont *font = fonts[i];
            UIColor *color = colors[i];
            NSRange range = NSRangeFromString(ranges[i]);
            [attri addAttribute:NSFontAttributeName value:font range:range];
            [attri addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    return attri;
}
@end
