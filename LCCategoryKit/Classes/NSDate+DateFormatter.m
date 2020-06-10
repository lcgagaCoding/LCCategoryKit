//
//  NSDate+DateFormatter.m
//  YCFunctionModule
//
//  Created by 刘成 on 2019/3/31.
//

#import "NSDate+DateFormatter.h"

static const NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (DateFormatter)

#pragma mark - 获取日历单例对象
+ (NSCalendar *)calendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        // 创建日历对象：返回当前客户端的逻辑日历(当每次修改系统日历设定，其实例化的对象也会随之改变)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    }
    return sharedCalendar;
}


#pragma mark - 获取指定日期的年份
- (NSInteger)yc_year {
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.year;
}

#pragma mark - 获取指定日期的月份
- (NSInteger)yc_month {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.month;
}

#pragma mark - 获取指定日期的天
- (NSInteger)yc_day {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.day;
}

#pragma mark - 获取指定日期的小时
- (NSInteger)yc_hour {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.hour;
}

#pragma mark - 获取指定日期的分钟
- (NSInteger)yc_minute {
    NSDateComponents *comps = [[NSDate calendar] components:unitFlags fromDate:self];
    return comps.minute;
}

#pragma mark - 获取指定日期的秒
- (NSInteger)yc_second {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.second;
}

#pragma mark - 获取指定日期的星期
- (NSInteger)yc_weekday {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.weekday;
}


#pragma mark - 创建date
+ (NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSCalendar *calendar = [NSDate calendar];
    // 初始化日期组件
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    if (year >= 0) {
        components.year = year;
    }
    if (month >= 0) {
        components.month = month;
    }
    if (day >= 0) {
        components.day = day;
    }
    if (hour >= 0) {
        components.hour = hour;
    }
    if (minute >= 0) {
        components.minute = minute;
    }
    if (second >= 0) {
        components.second = second;
    }
    NSDate *date = [calendar dateFromComponents:components];
    return date;
}

+ (NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setYear:year month:month day:day hour:hour minute:minute second:-1];
}

+ (NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [self yc_setYear:year month:month day:day hour:-1 minute:-1 second:-1];
}

+ (NSDate *)yc_setYear:(NSInteger)year month:(NSInteger)month {
    return [self yc_setYear:year month:month day:-1 hour:-1 minute:-1 second:-1];
}

+ (NSDate *)yc_setYear:(NSInteger)year {
    return [self yc_setYear:year month:-1 day:-1 hour:-1 minute:-1 second:-1];
}

+ (NSDate *)yc_setMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setYear:-1 month:month day:day hour:hour minute:minute second:-1];
}

+ (NSDate *)yc_setMonth:(NSInteger)month day:(NSInteger)day {
    return [self yc_setYear:-1 month:month day:day hour:-1 minute:-1 second:-1];
}

+ (NSDate *)yc_setHour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setYear:-1 month:-1 day:-1 hour:hour minute:minute second:-1];
}

+ (NSDate *)setYear:(NSInteger)year {
    return [self yc_setYear:year];
}

+ (NSDate *)setYear:(NSInteger)year month:(NSInteger)month {
    return [self yc_setYear:year month:month];
}

+ (NSDate *)setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [self yc_setYear:year month:month day:day];
}

+ (NSDate *)setYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setYear:year month:month day:day hour:hour minute:minute];
}

+ (NSDate *)setMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setMonth:month day:day hour:hour minute:minute];
}

+ (NSDate *)setMonth:(NSInteger)month day:(NSInteger)day {
    return [self yc_setMonth:month day:day];
}

+ (NSDate *)setHour:(NSInteger)hour minute:(NSInteger)minute {
    return [self yc_setHour:hour minute:minute];
}


#pragma mark - 日期和字符串之间的转换：NSDate --> NSString
+ (NSString *)yc_getDateString:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    dateFormatter.dateFormat = format;
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

#pragma mark - 日期和字符串之间的转换：NSString --> NSDate
+ (NSDate *)yc_getDate:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    dateFormatter.dateFormat = format;
    NSDate *destDate = [dateFormatter dateFromString:dateString];
    
    return destDate;
}

#pragma mark - 算法1：获取某个月的天数（通过年月求每月天数）
+ (NSUInteger)yc_getDaysInYear:(NSInteger)year month:(NSInteger)month {
    BOOL isLeapYear = year % 4 == 0 ? (year % 100 == 0 ? (year % 400 == 0 ? YES : NO) : YES) : NO;
    switch (month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:
        {
        return 31;
        break;
        }
        case 4:case 6:case 9:case 11:
        {
        return 30;
        break;
        }
        case 2:
        {
        if (isLeapYear) {
            return 29;
            break;
        } else {
            return 28;
            break;
        }
        }
        default:
            break;
    }
    return 0;
}

#pragma mark - 算法2：获取某个月的天数（通过年月求每月天数）
+ (NSUInteger)yc_getDaysInYear2:(NSInteger)year month:(NSInteger)month {
    NSDate *date = [NSDate yc_getDate:[NSString stringWithFormat:@"%@-%@", @(year), @(month)] format:@"yyyy-MM"];
    // 指定日历的算法(这里按公历)
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 只要给个时间给日历,就会帮你计算出来。
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:date];
    return range.length;
}

#pragma mark - 获取 日期加上/减去某天数后的新日期
- (NSDate *)yc_getNewDate:(NSDate *)date addDays:(NSTimeInterval)days {
    // days 为正数时，表示几天之后的日期；负数表示几天之前的日期
    return [self dateByAddingTimeInterval:60 * 60 * 24 * days];
}

#pragma mark - 获取 今年加上/减去某年数后的新日期
+ (nullable NSDate *)yc_getYearDistanceNow:(NSInteger)years {
    
    return [self yc_getYearDistanceDate:[NSDate date] years:years];
}

+ (nullable  NSDate *)yc_getYearDistanceDate:(NSDate *)date years:(NSInteger)years {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:years];
    NSDate *newDate = [calendar dateByAddingComponents:comps toDate:date options:0];
    return newDate;
}

/* 最小日期 */
+ (nullable NSDate *)yc_getMinDate {

    return [self yc_getYearDistanceNow:-200];
}

/* 最大日期 */
+ (nullable NSDate *)yc_getMaxDate {
    
    return [self yc_getYearDistanceNow:200];
}

#pragma mark - 日期/字符串转时间戳
+ (NSTimeInterval)yc_getStringTime:(NSString *)dateStr format:(YCDateFormatterType)format {
    
    NSDate *date = [NSDate yc_getDate:dateStr format:[NSDate yc_format:format]];
    return [date timeIntervalSince1970];
}

//13位时间戳
+ (NSTimeInterval)yc_getStringTimeForThirteenBit:(NSString *)dateStr format:(YCDateFormatterType)format {
    NSDate *date = [NSDate yc_getDate:dateStr format:[NSDate yc_format:format]];
    return fabs([date timeIntervalSince1970]) > 10000000000 ?:[date timeIntervalSince1970] * 1000;
}

+ (NSTimeInterval)yc_getDateTime:(NSDate *)date format:(YCDateFormatterType)format {
    
    NSString *dateStr = [NSDate yc_getDateString:date format:[NSDate yc_format:format]];
    return [NSDate yc_getStringTime:dateStr format:format]*1000;
}

+ (NSString *)yc_getTimeString:(NSTimeInterval)time format:(YCDateFormatterType)format {
    //可能是13位毫秒时间戳
    if (fabs(time) > 10000000000) {
        time = time/1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [NSDate yc_getDateString:date format:[NSDate yc_format:format]];
}

+ (NSString *)yc_getTimeDateStr:(NSString *)dateStr format:(YCDateFormatterType)format{
    return [self yc_getTimeString:[dateStr doubleValue] format:format];
}

+ (NSString *)yc_getDateStr:(NSString *)dateStr format:(YCDateFormatterType)format
{
    return [NSString stringWithFormat:@"%.f",[self yc_getStringTime:dateStr format:format]*1000];
}



+ (NSString *)dateConversionTimeStamp:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return timeSp;
}

#pragma mark - 比较两个时间大小（可以指定比较级数，即按指定格式进行比较）
- (NSComparisonResult)yc_compare:(NSDate *)targetDate format:(NSString *)format {
    NSString *dateString1 = [NSDate yc_getDateString:self format:format];
    NSString *dateString2 = [NSDate yc_getDateString:targetDate format:format];
    NSDate *date1 = [NSDate yc_getDate:dateString1 format:format];
    NSDate *date2 = [NSDate yc_getDate:dateString2 format:format];
    if ([date1 compare:date2] == NSOrderedDescending) {
        return 1;
    } else if ([date1 compare:date2] == NSOrderedAscending) {
        return -1;
    } else {
        return 0;
    }
}

+ (NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (NSString *)yc_format:(YCDateFormatterType)type {
    
    switch (type) {
        case YCDateFormatterTypeYYYYMMDD:
            return @"yyyy年MM月dd日";
            break;
        case YCDateFormatterTypeYYYYMM:
            return @"yyyy年MM月";
            break;
        case YCDateFormatterTypeMMDD:
            return @"MM月dd日";
            break;
        case YCDateFormatterTypeYYYY_MM_DD:
            return @"yyyy-MM-dd";
            break;
        case YCDateFormatterTypeYYYY_MM:
            return @"yyyy-MM";
            break;
        case YCDateFormatterTypeMM_DD:
            return @"MM-dd";
            break;
        case YCDateFormatterTypeYYYY_MM_dd_HH_mm_ss:
            return @"YYYY-MM-dd HH:mm:ss";
            break;
        case YCDateFormatterTypeYYYY_MM_dd_HH_mm:
            return @"YYYY-MM-dd HH:mm";
            break;
        case YCDateFormatterTypeHH_mm_ss:
            return @"HH:mm:ss";
            break;
        case YCDateFormatterTypeMM_DD_HH_mm_ss:
            return @"MM.dd HH:mm:ss" ;
            break;
        case YCDateFormatterTypeDD_HH_mm_ss:
           return @"dd日 HH:mm:ss" ;
           break;
    }
    return nil;
}

+ (NSString *)yc_getTimeWithTimeInterval:(NSTimeInterval)time{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSDate yc_format:YCDateFormatterTypeYYYY_MM_DD]];
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
    NSDate *now = [NSDate date];
    NSString *dateNow = [dateFormatter stringFromDate:now];
    if ([timeStr isEqualToString:dateNow]) {
        [dateFormatter setDateFormat:[NSDate yc_format:YCDateFormatterTypeHH_mm_ss]];
    }
    return [dateFormatter stringFromDate:timeDate];
}

+ (NSString *)dateStringWithYMDString:(NSString *)string oldFormat:(YCDateFormatterType)oldFormat newFormat:(YCDateFormatterType)newFormat {
   NSTimeZone *timeZone=[NSTimeZone localTimeZone];
   
   NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
   fmt.dateFormat = [self yc_format:oldFormat];
   fmt.timeZone = timeZone;
    
   NSDateFormatter *dstFmt=[[NSDateFormatter alloc]init];
   dstFmt.dateFormat = [self yc_format:newFormat];
   dstFmt.timeZone = timeZone;

   NSDate *srcDate=[fmt dateFromString:string];
    NSInteger interval = [timeZone secondsFromGMTForDate:srcDate];
    NSDate *date = [srcDate dateByAddingTimeInterval:interval];
   return [dstFmt stringFromDate:date];
}

@end
