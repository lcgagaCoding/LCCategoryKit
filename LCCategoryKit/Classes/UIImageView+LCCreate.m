//
//  UIImageView+LCCreate.m
//  SmallDetective
//
//  Created by 刘成 on 17/4/19.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "UIImageView+LCCreate.h"
#import "UIImage+YCBundle.h"

@implementation UIImageView (LCCreate)



//快速创建imageView
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)image
{
    return [UIImageView imageViewWithFrame:frame image:image bundle:nil];
}

//快速创建imageView
+(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)image
                 bundle:(NSString *)bundleName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    if (bundleName) {
        imageView.image = [UIImage yc_imgWithName:image bundle:bundleName];
    }else{
        imageView.image = [UIImage imageNamed:image];
    }
    
    return imageView;
}

+ (UIImageView *)imageViewWithImage:(NSString *)image bundle:(NSString *)bundle
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    if (bundle) {
        imageView.image = [UIImage yc_imgWithName:image bundle:bundle];
    }else{
        imageView.image = [UIImage imageNamed:image];
    }
    return imageView;
}

@end
