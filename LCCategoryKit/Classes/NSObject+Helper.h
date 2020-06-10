//
//  NSObject+Helper.h
//  YCCategoryModule
//
//  Created by 刘成 on 2019/4/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Helper)
/**
 获取当前控制器
 
 @return 控制器
 */
- (UIViewController *)yc_getCurrentViewController;

/**
 安全数组
 */
- (id)safeArr;

/**
 安全字典
 */
- (id)safeDict;

- (BOOL)objectIsEmpty;


@end

NS_ASSUME_NONNULL_END
