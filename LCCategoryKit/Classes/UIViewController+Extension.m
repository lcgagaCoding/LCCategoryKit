//
//  UIViewController+Extension.m
//  YCCategoryModule
//
//  Created by 刘成 on 2019/12/11.
//

#import "UIViewController+Extension.h"
@implementation UIViewController (Extension)
- (UIViewController*)backViewController {
    NSUInteger index = [self.navigationController.viewControllers indexOfObject:self];
    if (index!=0 && index != NSNotFound) {
        return [self.navigationController.viewControllers objectAtIndex:index -1];
    }else {
        return nil;
    }
}

- (NSString *)backViewControllerString {
    return NSStringFromClass([self.backViewController class]);
}

- (UITabBar *)getTabBar {
    return self.tabBarController.tabBar;
}

@end
