//
//  UIImage+Extension.m
//  LCCategoryModule
//
//  Created by 刘成 on 2019/4/8.
//

#import "UIImage+Extension.h"
#import <AVFoundation/AVFoundation.h>
#import "UIImage+LCBundle.h"
@implementation UIImage (Extension)


/**
 * 加文字水印
 @param logoImage 需要加文字的图片
 @param watemarkText 文字描述
 @returns 加好文字的图片
 */
+ (UIImage *)addWatemarkTextAfteriOS7_WithLogoImage:(UIImage *)logoImage watemarkText:(NSString *)watemarkText{
    int w = logoImage.size.width;
    int h = logoImage.size.height;
    NSInteger fontSize = ceil(MIN(w, h)*0.02);
    
    UIGraphicsBeginImageContext(logoImage.size);
    [[UIColor whiteColor] set];
    [logoImage drawInRect:CGRectMake(0, 0, w, h)];
    UIFont * font = [UIFont systemFontOfSize:fontSize];
    //    [watemarkText drawInRect:CGRectMake(10, 10, 600, fontSize*10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:kUIColorFromRGB(0x2435EF)}];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 6.0;
    shadow.shadowOffset = CGSizeMake(0, 0);
    shadow.shadowColor = [UIColor blackColor];
    [watemarkText drawInRect:CGRectMake(10, 10, 600, fontSize*10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor whiteColor],NSShadowAttributeName:shadow}];
    
    //    [mark drawInRect:CGRectMake(20,30 ,w ,fontSize*10) withAttributes:attr];         //左上角
    //    [mark drawInRect:CGRectMake(w - 10,20 ,100 ,100 ) withAttributes:attr];      //右上角
    //    [mark drawInRect:CGRectMake(w - 12, h -12 ,100 , 100) withAttributes:attr];  //右下角
    //    [mark drawInRect:CGRectMake(10, h - 12, 21, 12) withAttributes:attr];    //左下角
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 * 加图片水印
 @param logoImage 需要加水印的logo图片
 @param watemarkImage 水印图片
 @returns 加好水印的图片
 */
+ (UIImage *)addWatemarkImageWithLogoImage:(UIImage *)logoImage watemarkImage:(UIImage *)watemarkImage logoImageRect:(CGRect)logoImageRect watemarkImageRect:(CGRect)watemarkImageRect{
    // 创建一个graphics context来画我们的东西
    UIGraphicsBeginImageContext(logoImageRect.size);
    // graphics context就像一张能让我们画上任何东西的纸。我们要做的第一件事就是把person画上去
    [logoImage drawInRect:CGRectMake(0, 0, logoImageRect.size.width, logoImageRect.size.height)];
    // 然后在把hat画在合适的位置
    [watemarkImage drawInRect:CGRectMake(watemarkImageRect.origin.x, watemarkImageRect.origin.y, watemarkImageRect.size.width, watemarkImageRect.size.height)];
    // 通过下面的语句创建新的UIImage
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 最后，我们必须得清理并关闭这个再也不需要的context
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 * 加半透明水印
 @param logoImage 需要加水印的图片
 @param translucentWatemarkImage 水印
 @returns 加好水印的图片
 */
+ (UIImage *)addWatemarkImageWithLogoImage:(UIImage *)logoImage translucentWatemarkImage:(UIImage *)translucentWatemarkImage logoImageRect:(CGRect)logoImageRect translucentWatemarkImageRect:(CGRect)translucentWatemarkImageRect{
    UIGraphicsBeginImageContext(logoImage.size);    [logoImage drawInRect:CGRectMake(0, 0, logoImage.size.width, logoImage.size.height)];
    // 四个参数为水印的位置
    [translucentWatemarkImage drawInRect:CGRectMake(logoImage.size.width - 110, logoImage.size.height - 25, 100, 25)];
    UIImage * resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (void)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength withBlock:(void (^)(NSData *imageData))block{
    if (maxLength <= 0 || [self isKindOfClass:[NSNull class]] || self == nil){
        block(nil);
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *newImage = [image copy];
        {
        CGFloat clipScale = 0.9;
//        NSData *pngData = UIImagePNGRepresentation(image);
//        NSLog(@"Original pnglength %zd", pngData.length);
        NSData *jpgData = UIImageJPEGRepresentation(image, 1.0);
        NSLog(@"Original jpglength %zd", jpgData.length);
        while (jpgData.length > maxLength) {
            NSData *newImageData = UIImageJPEGRepresentation(newImage, 0.0);
            if (newImageData.length < maxLength) {
                CGFloat scale = 1.0;
                newImageData = UIImageJPEGRepresentation(newImage, scale);
                while (newImageData.length > maxLength) {
                    scale -= 0.1;
                    newImageData = UIImageJPEGRepresentation(newImage, scale);
                }
                jpgData = newImageData;
                break;
            } else {
                newImage = [self compressWithImage:newImage width:newImage.size.width * clipScale];
                jpgData = UIImageJPEGRepresentation(newImage, 1.0);
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block(jpgData);
        });
        }
    });
}

+ (UIImage *)compressWithImage:(UIImage *)image width:(CGFloat)width {
    if (width <= 0 || [image isKindOfClass:[NSNull class]] || image == nil) return nil;
    CGSize newSize = CGSizeMake(width, width * (image.size.height / image.size.width));
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

//获取视频的第一帧截图, 返回UIImage
+ (UIImage*)getVideoPreViewImageWithPath:(NSURL *)videoPath {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoPath options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time  = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error   = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *img = [[UIImage alloc] initWithCGImage:image];
    
    return img;
}

- (instancetype)circleImage
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImage:(NSString *)name {
    return [[self imageNamed:name] circleImage];
}

/*!
 *  @brief 使图片压缩后刚好小于指定大小
 *
 *  @param image 当前要压缩的图 maxLength 压缩后的大小
 *
 *  @return 图片对象
 */
+ (UIImage *)compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength {
    //首先判断原图大小是否在要求内，如果满足要求则不进行压缩，over
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    //原图大小超过范围，先进行“压处理”，这里 压缩比 采用二分法进行处理，6次二分后的最小压缩比是0.015625，已经够小了
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //判断“压处理”的结果是否符合要求，符合要求就over
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    //缩处理，直接用大小的比例作为缩处理的比例进行处理，因为有取整处理，所以一般是需要两次处理
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        //获取处理后的尺寸
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        //通过图片上下文进行处理图片
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        //获取处理后图片的大小
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}


@end
