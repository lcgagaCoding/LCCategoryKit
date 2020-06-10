//
//  UIImageView+LCCreate.h
//  SmallDetective
//
//  Created by 刘成 on 17/4/19.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LCCreate)

//快速创建imageView
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)image;

//快速创建imageView
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)image
                 bundle:(NSString *)bundleName;

+ (UIImageView *)imageViewWithImage:(NSString *)image bundle:(NSString *)bundle;

@end
