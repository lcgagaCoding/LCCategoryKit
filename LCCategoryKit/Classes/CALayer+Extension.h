//
//  CALayer+LCLayerColor.h
//  NowBo
//
//  Created by 刘成 on 2018/4/10.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
//
@interface CALayer (Extension)

@property(nonatomic, assign) UIColor *borderUIColor;

@property(nonatomic, assign) UIColor *shadowUIColor;


- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
