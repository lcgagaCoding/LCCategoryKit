//
//  UIImage+Extension.h
//  LCCategoryModule
//
//  Created by 刘成 on 2019/4/8.
//

#import <UIKit/UIKit.h>


@interface UIImage (Extension)

/**
 * 加文字水印
 @param logoImage 需要加文字的图片
 @param watemarkText 文字描述
 @returns 加好文字的图片
 */
+ (UIImage *)addWatemarkTextAfteriOS7_WithLogoImage:(UIImage *)logoImage watemarkText:(NSString *)watemarkText;

/**
 * 加图片水印
 @param logoImage 需要加水印的logo图片
 @param watemarkImage 水印图片
 @returns 加好水印的图片
 */
+ (UIImage *)addWatemarkImageWithLogoImage:(UIImage *)logoImage watemarkImage:(UIImage *)watemarkImage logoImageRect:(CGRect)logoImageRect watemarkImageRect:(CGRect)watemarkImageRect;
/**
 * 加半透明水印
 @param logoImage 需要加水印的图片
 @param translucentWatemarkImage 水印
 @returns 加好水印的图片
 */
+ (UIImage *)addWatemarkImageWithLogoImage:(UIImage *)logoImage translucentWatemarkImage:(UIImage *)translucentWatemarkImage logoImageRect:(CGRect)logoImageRect translucentWatemarkImageRect:(CGRect)translucentWatemarkImageRect;


#pragma mark 图片压缩到指定字节长度
+ (void)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength withBlock:(void (^)(NSData *imageData))block;

+ (UIImage *)compressWithImage:(UIImage *)image width:(CGFloat)width;
/*根据颜色生成图片*/
+ (UIImage *)imageWithColor:(UIColor *)color;

//获取视频的第一帧截图, 返回UIImage
+ (UIImage*)getVideoPreViewImageWithPath:(NSURL *)videoPath;

/**
 *  返回圆形图片
 */
- (instancetype)circleImage;
+ (instancetype)circleImage:(NSString *)name;

/*!
*  @brief 使图片压缩后刚好小于指定大小
*
*  @param image 当前要压缩的图 maxLength 压缩后的大小
*
*  @return 图片对象
*/
+ (UIImage *)compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength ;

@end

