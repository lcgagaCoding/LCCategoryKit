//
//  UIButton+ImagePosition.h
//  YCCategoryModule
//
//  Created by 刘成 on 2019/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YCImagePosition) {
    YCImagePositionLeft = 0,               //图片在左，文字在右，默认
    YCImagePositionRight = 1,              //图片在右，文字在左
    YCImagePositionTop = 2,                //图片在上，文字在下
    YCImagePositionBottom = 3              //图片在下，文字在上
};


@interface UIButton (ImagePosition)
/**
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 
 @param position 图片位置
 @param space 图片和文字的间隔
 */
- (void)yc_imagePosition:(YCImagePosition)position space:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
