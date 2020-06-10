//
//  UIImage+wgBundle.h
//  Pods-wgCommonKit_Example
//
//  Created by wanggang on 2018/5/21.
//

#import <UIKit/UIKit.h>

@interface UIImage (YCBundle)

/**
 登录
 */
+ (instancetype)yc_loginImgWithName:(NSString *)name;
/**
 首页
 */
+ (instancetype)yc_homeImgWithName:(NSString *)name;

/**
 我的
 */
+ (instancetype)yc_mineImgWithName:(NSString *)name;

/**
 公共资源
 */
+ (UIImage *)yc_resourceModuleImgWithName:(NSString *)name;

/**
  Base
 */
+ (instancetype)yc_BaseImgWithName:(NSString *)name;

+ (instancetype)yc_imgWithName:(NSString *)name bundle:(NSString *)bundleName;

+ (instancetype)yc_imageWithNamed:(NSString *)name bundle:(NSString *)bundleName type:(NSString *)type;

//业务
+ (instancetype)yc_businessImgWithName:(NSString *)name;

+ (instancetype)yc_cdloginImgWithName:(NSString *)name;

+ (instancetype)yc_cdhomeImgWithName:(NSString *)name;

//征信
+ (instancetype)yc_creditImgWithName:(NSString *)name;

+ (instancetype)yc_homeImgWithName:(NSString *)name bundle:(NSString *)bundle;
+ (instancetype)yc_loginImgWithName:(NSString *)name bundle:(NSString *)bundle;

+ (instancetype)yc_auditImgWithName:(NSString *)name;
@end
