//
//  UIView+LCGradient.m
//  LCCategoryModule
//
//  Created by 刘成 on 2019/5/3.
//

#import "UIView+LCGradient.h"
#import <objc/runtime.h>

@implementation UIView (LCGradient)


+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)lc_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view lc_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)lc_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.lc_colors = [colorsM copy];
    self.lc_locations = locations;
    self.lc_startPoint = startPoint;
    self.lc_endPoint = endPoint;
}

- (void)lc_setYDirectionGradientWithColors:(NSArray<UIColor *> *)colors
{
    [self lc_setGradientBackgroundWithColors:colors locations:nil startPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
}


#pragma mark- Getter&Setter

- (NSArray *)lc_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setlc_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(lc_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.lc_colors];
    }
}

- (NSArray<NSNumber *> *)lc_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setlc_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(lc_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.lc_locations];
    }
}

- (CGPoint)lc_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setlc_startPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(lc_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.lc_startPoint];
    }
}

- (CGPoint)lc_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setlc_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(lc_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.lc_endPoint];
    }
}


@end

@implementation UILabel (LCGradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end


