//
//  CALayer+LCLayerColor.m
//  NowBo
//
//  Created by 刘成 on 2018/4/10.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "CALayer+Extension.h"

@implementation CALayer (Extension)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}


-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor *)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

-(void)setShadowUIColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

-(UIColor *)shadowUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}



@end
