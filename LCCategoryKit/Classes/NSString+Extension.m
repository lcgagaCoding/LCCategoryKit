//
//  NSString+Extension.m
//  Pods
//
//  Created by 刘成 on 2019/4/19.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)lc_isNotEmpty {
    
    NSString *result = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return result.length > 0;
}

- (BOOL)lc_isEmpty {
    
    NSString *result = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return result.length <= 0;
}

+ (BOOL)lc_isEmptyStr:(NSString *)str {
    NSString *result = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return result.length <= 0;
}

- (NSString *)lc_suffix:(NSString *)aString {
    if (!aString) return self;
    return [self stringByAppendingString:aString];
}

- (NSString *)lc_prefix:(NSString *)aString {
    return [aString lc_suffix:self];
}

- (NSString *)lc_wrapLeft:(NSString *)lString right:(NSString *)rString {
    
    return [[self lc_prefix:lString] lc_suffix:rString];
}

- (NSString *)lc_wrap:(NSString *)aString {
    
    return [self lc_wrapLeft:aString right:aString];
}

- (NSString *)base64EncodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)lc_344_mobile{
    if (self.length<11) {
        return self;
    }
   return [NSString stringWithFormat:@"%@-%@-%@",[self substringToIndex:3] ,[self substringWithRange:NSMakeRange(3, 4)],[self substringWithRange:NSMakeRange(7, 4)]];
}

- (NSString *)lc_344_mobile_empty{
    if (self.length<11) {
        return self;
    }
    return [NSString stringWithFormat:@"%@ %@ %@",[self substringToIndex:3] ,[self substringWithRange:NSMakeRange(3, 4)],[self substringWithRange:NSMakeRange(7, 4)]];
}

- (NSString *)lc_deleteEmpty
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)lc_fourBitsConversion{
    if (self && ![self isEqualToString:@""]) {
        NSInteger num = [self integerValue];
        if (num>=100000000) {
            return [NSString stringWithFormat:@"%.2f亿",(CGFloat)num/100000000];
        }else if (num>=10000) {
            return [NSString stringWithFormat:@"%.2f万",(CGFloat)num/10000];
        }
        return [NSString stringWithFormat:@"%.2f元",[self floatValue]];
    }
    return @"0.00万";
}

- (NSString *)lc_mileage{
    if (self && ![self isEqualToString:@""]) {
        NSInteger num = [self integerValue];
        if (num>=10000) {
            return [NSString stringWithFormat:@"%.2f万公里",(CGFloat)num/10000];
        }
        return [NSString stringWithFormat:@"%.2f公里",[self floatValue]];
    }
    return @"0.00公里";
}

- (NSString *)bankCardFormat
{
    NSString *getString = @"";
    
    int a = (int)self.length/4;
    int b = (int)self.length%4;
    int c = a;
    if (b>0)
    {
        c = a+1;
    }
    else
    {
        c = a;
    }
    for (int i = 0 ; i<c; i++)
    {
        NSString *string = @"";
        
        if (i == (c-1))
        {
            if (b>0)
            {
                string = [self substringWithRange:NSMakeRange(4*(c-1), b)];
            }
            else
            {
                string = [self substringWithRange:NSMakeRange(4*i, 4)];
            }
            
        }
        else
        {
            string = [self substringWithRange:NSMakeRange(4*i, 4)];
        }
        
        if (i == 0) {
            getString = string;
        }else{
            getString =   [NSString stringWithFormat:@"%@-%@",getString,string];
        }
       
    }
    return getString;
}

- (NSString *)lc_leave2Decimal {
    return [NSString stringWithFormat:@"%.2lf",self.doubleValue];
}


+ (NSString *)transformPinYinWithString:(NSString *)chinese
{
    //转成可变字符串
    NSMutableString *tempStr1 = [NSMutableString stringWithString:chinese];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)tempStr1, NULL, kCFStringTransformToLatin, false);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)tempStr1, NULL, kCFStringTransformStripDiacritics, false);
    NSLog(@"汉字转拼音：tempStr1 == %@", tempStr1);  // ni hao
    tempStr1 = (NSMutableString *)tempStr1.uppercaseString;
    NSLog(@"小写转大写：tempStr1 == %@", tempStr1);  // NI HAO
    return tempStr1;
}

+ (NSString *)capitalLetterTransformPinYinWithString:(NSString *)chinese
{
    //转成可变字符串
    NSMutableString *tempStr1 = [NSMutableString stringWithString:chinese];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)tempStr1, NULL, kCFStringTransformToLatin, false);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)tempStr1, NULL, kCFStringTransformStripDiacritics, false);
    return [tempStr1 capitalizedString];
}

+ (BOOL)lc_validMobile:(NSString *)mobile {
    if (mobile.length != 11) {
        return NO;
    }
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES) ||
        ([regextestcm evaluateWithObject:mobile] == YES) ||
        ([regextestct evaluateWithObject:mobile] == YES) ||
        ([regextestcu evaluateWithObject:mobile] == YES)) {
        return YES;
    }else {
        return NO;
    }
}


- (NSString *)stringByReplacingOccurrencesOfStringWithBeginLocation:(NSUInteger)beginLocation endLocation:(NSUInteger)endLocation commmonString:(NSString *)commonString
{
    NSString *star = @"";
    for (int i = 0; i<self.length - endLocation - beginLocation; i++) {
        star = [star stringByAppendingString:commonString];
    }
    return  [self stringByReplacingCharactersInRange:NSMakeRange(beginLocation, self.length - endLocation - beginLocation)  withString:star];
}

- (NSString *)stringByReplacingOccurrencesOfStringWithBeginLocation:(NSUInteger)beginLocation length:(NSUInteger)length commmonString:(NSString *)commonString {
    
    NSString *star = @"";
    for (int i = 0; i<length; i++) {
        star = [star stringByAppendingString:commonString];
    }
    return  [self stringByReplacingCharactersInRange:NSMakeRange(beginLocation, length)  withString:star];
}

- (NSString *)afterPoint:(int)position{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithString:self];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

- (NSString *)notRounding:(float)number afterPoint:(int)position {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:number];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

@end
