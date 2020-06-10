//
//  NSString+Size.h
//  YCBaseUI
//
//  Created by 刘成 on 2019/3/30.
//

#import <Foundation/Foundation.h>


@interface NSString (Size)

- (CGFloat)yc_widthForFont:(UIFont *)font;
- (CGFloat)yc_heightForFont:(UIFont *)font width:(CGFloat)width;
- (CGSize)yc_sizeForFont:(UIFont *)font;
- (CGSize)yc_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
- (CGSize)yc_boundingRectWithSize:(CGSize)size font:(UIFont *)font;

@end
