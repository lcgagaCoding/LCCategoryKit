//
//  UIView+YCGradient.m
//  YCCategoryModule
//
//  Created by 刘成 on 2019/5/3.
//

#import "UIView+YCGradient.h"
#import <objc/runtime.h>

@implementation UIView (YCGradient)


+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)yc_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view yc_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)yc_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.yc_colors = [colorsM copy];
    self.yc_locations = locations;
    self.yc_startPoint = startPoint;
    self.yc_endPoint = endPoint;
}

- (void)yc_setYDirectionGradientWithColors:(NSArray<UIColor *> *)colors
{
    [self yc_setGradientBackgroundWithColors:colors locations:nil startPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
}


#pragma mark- Getter&Setter

- (NSArray *)yc_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYc_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(yc_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.yc_colors];
    }
}

- (NSArray<NSNumber *> *)yc_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYc_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(yc_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.yc_locations];
    }
}

- (CGPoint)yc_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setYc_startPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(yc_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.yc_startPoint];
    }
}

- (CGPoint)yc_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setYc_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(yc_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.yc_endPoint];
    }
}


@end

@implementation UILabel (YCGradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end


