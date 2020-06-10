//
//  UIImage+wgBundle.m
//  Pods-wgCommonKit_Example
//
//  Created by wanggang on 2018/5/21.
//

#import "UIImage+YCBundle.h"

@implementation UIImage (YCBundle)

+ (instancetype)yc_creditImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle:@"YCCreditModule" type:@"png"];
}

+ (instancetype)yc_businessImgWithName:(NSString *)name
{
   return [UIImage yc_imageWithNamed:name bundle:@"YCBusinessManagementModule" type:@"png"];
}

+ (instancetype)yc_loginImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle: @"YCLoginModule" type:@"png"];
}

+ (instancetype)yc_loginImgWithName:(NSString *)name bundle:(NSString *)bundle
{
    return [UIImage yc_imageWithNamed:name bundle: bundle type:@"png"];
}

+ (instancetype)yc_homeImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle:@"YCHomeModule" type:@"png"];
}

+ (instancetype)yc_homeImgWithName:(NSString *)name bundle:(NSString *)bundle
{
    return [UIImage yc_imageWithNamed:name bundle:bundle type:@"png"];
}

+ (instancetype)yc_mineImgWithName:(NSString *)name {
   return [UIImage yc_imageWithNamed:name bundle:@"YCMineModule" type:@"png"];
}

+ (instancetype)yc_BaseImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle:@"YCBaseUI" type:@"png"];
}

+ (UIImage *)yc_resourceModuleImgWithName:(NSString *)name {
    return [UIImage yc_imageWithNamed:name bundle:@"YCResources" type:@"png"];
}

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

+ (instancetype)yc_cdloginImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle:@"YCCDLoginModule" type:@"png"];
}

+ (instancetype)yc_cdhomeImgWithName:(NSString *)name
{
    return [UIImage yc_imageWithNamed:name bundle:@"YCCDHomeModule" type:@"png"];
}

+ (instancetype)yc_auditImgWithName:(NSString *)name {
    return [UIImage yc_imageWithNamed:name bundle:@"YCAuditManagementModule" type:@"png"];
}

@end
