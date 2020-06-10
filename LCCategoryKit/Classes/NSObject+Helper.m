//
//  NSObject+Helper.m
//  YCCategoryModule
//
//  Created by 刘成 on 2019/4/9.
//

#import "NSObject+Helper.h"

@implementation NSObject (Helper)

/**
 获取当前控制器
 
 @return 控制器
 */
- (UIViewController *)yc_getCurrentViewController{
    UIViewController* currentViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        //present方式，拿到presentedViewController
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
         //导航方式，拿到栈顶的controller
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
          UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
        //tabbar方式，拿到当前选中的controller
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
          UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
         //遍历子controllers，拿到最后一个controller
        } else {
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                currentViewController = currentViewController.childViewControllers.lastObject;
                return currentViewController;
            } else {
                return currentViewController;
            }
        }
    }
    return currentViewController;
}

/**
 安全数组
*/
- (id)safeArr{
    if (self == nil) {
        return @[];//为null时，直接赋空
    } else if ((NSNull *)self == [NSNull null]) {
        return @[];
    }
    return self;
}

/**
 安全字典
 */
- (id)safeDict{
    if (self == nil) {
        return @{};//为null时，直接赋空
    } else if ((NSNull *)self == [NSNull null]) {
        return @{};
    }
    return self;
}

- (BOOL)objectIsEmpty
{
    if (self == nil || [self isEqual:[NSNull null]] || [self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

@end
