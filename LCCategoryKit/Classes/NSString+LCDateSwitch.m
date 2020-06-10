//
//  NSString+LCDateSwitch.m
//  LCSaas
//
//  Created by 刘成 on 2018/3/8.
//  Copyright © 2018年 刘成. All rights reserved.
//

#import "NSString+LCDateSwitch.h"

@implementation NSString (LCDateSwitch)
//将某个时间转化成 时间戳

#pragma mark - 将某个时间转化成 时间戳

-(NSString *)timeSwitchWithFormatter:(NSString *)format{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:self]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    
    NSString *timeSp = [NSString stringWithFormat:@"%@",[NSNumber numberWithLongLong:[date timeIntervalSince1970]*1000]];

    return timeSp;
    
}
#pragma mark - 将yyyy-MM-dd->yyyy年MM月dd日
-(NSString *)timeSwitchWithYearMonthDay{
    NSString * s = [self stringByReplacingCharactersInRange:NSMakeRange(4, 1) withString:@"年"];
    s = [s stringByReplacingCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
    s = [s stringByAppendingString:@"日"];
    return s;
}

#pragma mark - 将时间戳->yyyy-MM-dd HH:mm
- (NSString *)dateWithTimeInterval{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    NSTimeInterval interval = self.length>10?[self doubleValue] / 1000.0:[self doubleValue];
    NSDate *stampDate = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *time = [formatter stringFromDate:stampDate];
    return time;
}

- (NSString *)dateWithTimeYMDInterval{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeInterval interval = self.length>10?[self doubleValue] / 1000.0:[self doubleValue];
    NSDate *stampDate = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *time = [formatter stringFromDate:stampDate];
    return time;
}

#pragma mark - 将时间戳->yyyy年MM月dd日
-(NSString *)timeItervalSwitchWithYearMonthDay{
    
    if(![[NSString stringWithFormat:@"%@",self] containsString:@"年"] && ![[NSString stringWithFormat:@"%@",self.length>1?[self substringFromIndex:1]:self] containsString:@"-"] && [NSString stringWithFormat:@"%@",self].length>0){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy年MM月dd日"];
        
        NSTimeInterval interval = self.length>10?[self doubleValue] / 1000.0:[self doubleValue];
        NSDate *stampDate = [NSDate dateWithTimeIntervalSince1970:interval];
        NSString *time = [formatter stringFromDate:stampDate];
        
        return time;

    }
    
    return self;
}

+ (NSString *)dataStrWithString:(NSString *)str
{
    if (str.length<8) {
        return str;
    }
    NSString *first = [str substringWithRange:NSMakeRange(0, 4)];
     NSString *second = [str substringWithRange:NSMakeRange(4, 2)];
     NSString *third = [str substringWithRange:NSMakeRange(6, 2)];
    return [NSString stringWithFormat:@"%@-%@-%@",first,second,third];
}

@end
