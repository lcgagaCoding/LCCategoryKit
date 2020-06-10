//
//  UITableViewCell+SeperatorLine.h
//  YCCategoryModule
//
//  Created by 刘成 on 2019/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YCBottomLineType) {
    YCBottomLineTypeZero,
    YCBottomLineTypeLeftInterspace,
    YCBottomLineTypeLeftAndRightInterspace
};

@interface UITableViewCell (SeperatorLine)

/** 显示下分割线 */
@property (assign, nonatomic) BOOL yc_showBottomLine;

/* 偏移量 */
@property (nonatomic, assign) CGFloat yc_offset;

@property (strong, nonatomic, readonly) UIView *yc_bottomLineView;
//设置底部分割线类型
@property (assign, nonatomic) YCBottomLineType yc_bottomLineType;

- (void)yc_showBottomLineWithLineType:(YCBottomLineType)lineType;

@end

NS_ASSUME_NONNULL_END
