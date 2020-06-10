//
//  UIViewController+Extension.h
//  YCCategoryModule
//
//  Created by 刘成 on 2019/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)
- (UIViewController*)backViewController;
- (NSString *)backViewControllerString;
- (UITabBar *)getTabBar;
@end

NS_ASSUME_NONNULL_END
