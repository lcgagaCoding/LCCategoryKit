//
//  NSString+LCAttriButedCreate.h
//  YCSaas
//
//  Created by 刘成 on 2018/5/29.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YCAttriButedCreate)

- (NSMutableAttributedString *)attributedWithTextColor:(UIColor*)color;
- (NSMutableAttributedString *)attributedWithTextColor:(UIColor*)color range:(NSRange)range;

- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font;
- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font range:(NSRange)range;

- (NSMutableAttributedString *)attributedWithTextFont:(UIFont*)font textColor:(UIColor*)color range:(NSRange)range;

- (NSMutableAttributedString *)attributedWithTextFonts:(NSArray <UIFont *>*)fonts textColors:(NSArray <UIColor *>*)colors ranges:(NSArray <NSString *>*)ranges;
@end
