//
//  NSBundle+wgSubBundle.h
//  CTMediator
//
//  Created by 刘成 on 2019/4/3.
//

#import <Foundation/Foundation.h>

@interface NSBundle (YCSubBundle)

+ (instancetype)yc_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass;

@end
