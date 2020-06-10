//
//  NSString+Extension.h
//  Pods
//
//  Created by 刘成 on 2019/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 非空验证

 @return 非空YES
 */
- (BOOL)lc_isNotEmpty;

/**
 空验证

 @return 空YES
 */
- (BOOL)lc_isEmpty;
+ (BOOL)lc_isEmptyStr:(NSString *)str;

// 实现点语法，如果字符串为nil，会崩溃
/** a + b -> ab */
- (NSString *)lc_suffix:(NSString *)aString;

/** a + b -> ba */
- (NSString *)lc_prefix:(NSString *)aString;

/** a + ( , ) -> (a) */
- (NSString *)lc_wrapLeft:(NSString *)lString right:(NSString *)rString;

/** a + ' -> 'a' */
- (NSString *)lc_wrap:(NSString *)aString;

- (NSString *)base64EncodeString:(NSString *)string;

- (NSString *)lc_344_mobile;

- (NSString *)lc_deleteEmpty;

//垫款金额
- (NSString *)lc_fourBitsConversion;

//手机号为空
- (NSString *)lc_344_mobile_empty;

//公里数
- (NSString *)lc_mileage;

//银行卡 6666-8888-9999-0000 格式
- (NSString *)bankCardFormat;

/** 10/10.000 -> 10.00 */
- (NSString *)lc_leave2Decimal;

//汉字转拼音
+ (NSString *)transformPinYinWithString:(NSString *)chinese;

+ (BOOL)lc_validMobile:(NSString *)mobile;



//用相同的字符替换字符串部分字符。比如 身份证用@“*”隐藏部分号码
- (NSString *)stringByReplacingOccurrencesOfStringWithBeginLocation:(NSUInteger)beginLocation endLocation:(NSUInteger)endLocation commmonString:(NSString *)commonString;

- (NSString *)stringByReplacingOccurrencesOfStringWithBeginLocation:(NSUInteger)beginLocation length:(NSUInteger)length commmonString:(NSString *)commonString;

- (NSString *)notRounding:(float)number afterPoint:(int)position;//保留小数位数，不四舍五入。
- (NSString *)afterPoint:(int)position; //保留小数位数，不四舍五入。

+ (NSString *)capitalLetterTransformPinYinWithString:(NSString *)chinese ;

@end

NS_ASSUME_NONNULL_END
