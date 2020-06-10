//
//  UIImage+wgBundle.m
//  Pods-wgCommonKit_Example
//
//  Created by wanggang on 2018/5/21.
//

#import "UIImage+YCBundle.h"

@implementation UIImage (YCBundle)


+ (instancetype)yc_imgWithName:(NSString *)name bundle:(NSString *)bundleName{
    
    return [UIImage yc_imageWithNamed:name bundle:bundleName type:@"png"];
}

+ (instancetype)yc_imageWithNamed:(NSString *)name bundle:(NSString *)bundleName type:(NSString *)type {
    
    NSString *mainBundlePath = [NSBundle mainBundle].bundlePath;
    NSString *bundlePath = [NSString stringWithFormat:@"%@/%@.bundle",mainBundlePath,bundleName];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    if (bundle == nil) {
        bundlePath = [NSString stringWithFormat:@"%@/Frameworks/%@.framework/%@.bundle",mainBundlePath,bundleName,bundleName];
        bundle = [NSBundle bundleWithPath:bundlePath];
    }
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:type]];
    }
    return nil;
}


@end
