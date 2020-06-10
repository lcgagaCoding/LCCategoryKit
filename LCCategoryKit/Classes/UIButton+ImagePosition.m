//
//  UIButton+ImagePosition.m
//  LCCategoryModule
//
//  Created by 刘成 on 2019/5/24.
//

#import "UIButton+ImagePosition.h"

@implementation UIButton (ImagePosition)

- (void)lc_imagePosition:(LCImagePosition)position space:(CGFloat)space {
 
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGSize size = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.height, self.bounds.size.width) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    CGFloat labelWidth = ceil(size.width);
    CGFloat labelheight = ceil(size.height);
    
    //image中心移动的x距离
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;
    //image中心移动的y距离
    CGFloat imageOffsetY = imageHeight / 2 + space / 2;
    //label中心移动的x距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;
    //label中心移动的y距离
    CGFloat labelOffsetY = labelheight / 2 + space / 2;
    switch (position) {
        case LCImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - space / 2, 0, space / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space / 2, 0, -space / 2);
            break;
        case LCImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space/2, 0, -(labelWidth + space/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + space/2), 0, imageHeight + space/2);
            break;
        case LCImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
        case LCImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
        default:
            break;
    }
}

@end
