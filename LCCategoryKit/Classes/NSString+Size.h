//
//  NSString+Size.h
//  LCBaseUI
//
//  Created by 刘成 on 2019/3/30.
//

#import <Foundation/Foundation.h>


@interface NSString (Size)

- (CGFloat)lc_widthForFont:(UIFont *)font;
- (CGFloat)lc_heightForFont:(UIFont *)font width:(CGFloat)width;
- (CGSize)lc_sizeForFont:(UIFont *)font;
- (CGSize)lc_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
- (CGSize)lc_boundingRectWithSize:(CGSize)size font:(UIFont *)font;

@end
