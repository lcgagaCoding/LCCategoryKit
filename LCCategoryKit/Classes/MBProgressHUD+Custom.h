//
//  MBProgressHUD+Custom.h
//  LCCategoryModule
//
//  Created by 刘成 on 2019/4/11.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Custom)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
