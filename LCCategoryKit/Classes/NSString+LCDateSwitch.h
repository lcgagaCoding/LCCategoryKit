//
//  NSString+LCDateSwitch.h
//  LCSaas
//
//  Created by 刘成 on 2018/3/8.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LCDateSwitch)

#pragma mark - 将某个时间转化成 时间戳
- (NSString *)timeSwitchWithFormatter:(NSString *)format;

#pragma mark - 将yyyy-MM-dd->yyyy年MM月dd日
- (NSString *)timeSwitchWithYearMonthDay;

#pragma mark - 将时间戳->yyyy-MM-dd hh:mm
- (NSString *)dateWithTimeInterval;

#pragma mark - 将时间戳->yyyy年MM月dd日
-(NSString *)timeItervalSwitchWithYearMonthDay;

- (NSString *)dateWithTimeYMDInterval;

//日期字符串转日期
+ (NSString *)dataStrWithString:(NSString *)str;

@end
