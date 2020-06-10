//
//  NSDate+DateFormatter.h
//  YCFunctionModule
//
//  Created by 刘成 on 2019/3/31.
//

#import <Foundation/Foundation.h>

//日期转化格式
typedef NS_ENUM(NSUInteger, YCDateFormatterType) {
    YCDateFormatterTypeYYYYMMDD = 0,        //yyyy年MM月dd日
    YCDateFormatterTypeYYYYMM,              //yyyy年MM月
    YCDateFormatterTypeMMDD,                //MM月dd日
    YCDateFormatterTypeYYYY_MM_DD,          //yyyy-MM-dd
    YCDateFormatterTypeYYYY_MM,             //yyyy-MM
    YCDateFormatterTypeMM_DD ,               //MM-dd
    YCDateFormatterTypeYYYY_MM_dd_HH_mm_ss,  //@"YYYY-MM-dd HH:mm:ss"
    YCDateFormatterTypeYYYY_MM_dd_HH_mm,//@"YYYY-MM-dd HH:mm"
    YCDateFormatterTypeHH_mm_ss ,//HH:mm:ss
    YCDateFormatterTypeMM_DD_HH_mm_ss, // MM:DD HH:mm:ss
    YCDateFormatterTypeDD_HH_mm_ss //xx日 HH:mm:ss
};

@interface NSDate (DateFormatter)

/// 获取指定date的详细信息
@property (readonly) NSInteger yc_year;    // 年
@property (readonly) NSInteger yc_month;   // 月
@property (readonly) NSInteger yc_day;     // 日
@property (readonly) NSInteger yc_hour;    // 时
@property (readonly) NSInteger yc_minute;  // 分
@property (readonly) NSInteger yc_second;  // 秒
@property (readonly) NSInteger yc_weekday; // 星期

/** 创建 date */
/** yyyy */
+ (nullable NSDate *)yc_setYear:(NSInteger)year;
/** yyyy-MM */
+ (nullable NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month;
/** yyyy-MM-dd */
+ (nullable NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
/** yyyy-MM-dd HH:mm */
+ (nullable NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute;
/** MM-dd HH:mm */
+ (nullable NSDate *)yc_setMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute;
/** MM-dd */
+ (nullable NSDate *)yc_setMonth:(NSInteger)month day:(NSInteger)day;
/** HH:mm */
+ (nullable NSDate *)yc_setHour:(NSInteger)hour minute:(NSInteger)minute;

/** 日期和字符串之间的转换：NSDate --> NSString */
+ (nullable  NSString *)yc_getDateString:(NSDate *)date format:(NSString *)format;
/** 日期和字符串之间的转换：NSString --> NSDate */
+ (nullable  NSDate *)yc_getDate:(NSString *)dateString format:(NSString *)format;
/** 获取某个月的天数（通过年月求每月天数）*/
+ (NSUInteger)yc_getDaysInYear:(NSInteger)year month:(NSInteger)month;
/**  获取 日期加上/减去某天数后的新日期 */
- (nullable NSDate *)yc_getNewDate:(NSDate *)date addDays:(NSTimeInterval)days;
/** 获取距离今年，前几年，或后几年 */
+ (nullable NSDate *)yc_getYearDistanceNow:(NSInteger)years;
/** 获取距离某个日期，前几年，或后几年 */
+ (nullable  NSDate *)yc_getYearDistanceDate:(NSDate *)date years:(NSInteger)years;

/* 最小日期 */
+ (nullable NSDate *)yc_getMinDate;
/* 最大日期 */
+ (nullable NSDate *)yc_getMaxDate;

/* 字符串转时间戳 */
+ (NSTimeInterval)yc_getStringTime:(NSString *)dateStr format:(YCDateFormatterType)format;

/* 日期转时间戳 */
+ (NSTimeInterval)yc_getDateTime:(NSDate *)date format:(YCDateFormatterType)format;

/* 时间戳转字符串 */
+ (NSString *)yc_getTimeString:(NSTimeInterval)time format:(YCDateFormatterType)format;

/* 时间戳字符串转日期字符串 */
+ (NSString *)yc_getTimeDateStr:(NSString *)dateStr format:(YCDateFormatterType)format;

/* 日期字符串转时间戳字符串 */
+ (NSString *)yc_getDateStr:(NSString *)dateStr format:(YCDateFormatterType)format;


/**
 *  比较两个时间大小（可以指定比较级数，即按指定格式进行比较）
 */
- (NSComparisonResult)yc_compare:(NSDate *)targetDate format:(NSString *)format;

//当前时间 1989-10-21 19:09:56
+ (NSString*)getCurrentTimes;

/* 获取格式字符串 */
+ (NSString *)yc_format:(YCDateFormatterType)type;

//首先判断是否是今天，今天显示时分秒，不是则显示年月日
+ (NSString *)yc_getTimeWithTimeInterval:(NSTimeInterval)time;


//时间转13位时间戳字符串。NSDate ----> 1564132074000
+ (NSString *)dateConversionTimeStamp:(NSDate *)date;

+ (NSString *)dateStringWithYMDString:(NSString *)string oldFormat:(YCDateFormatterType)oldFormat newFormat:(YCDateFormatterType)newFormat ;

//时间字符串 -> 13位时间戳
+ (NSTimeInterval)yc_getStringTimeForThirteenBit:(NSString *)dateStr format:(YCDateFormatterType)format ;

@end

