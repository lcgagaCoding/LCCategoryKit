//
//  UITableViewCell+SeperatorLine.h
//  LCCategoryModule
//
//  Created by 刘成 on 2019/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LCBottomLineType) {
    LCBottomLineTypeZero,
    LCBottomLineTypeLeftInterspace,
    LCBottomLineTypeLeftAndRightInterspace
};

@interface UITableViewCell (SeperatorLine)

/** 显示下分割线 */
@property (assign, nonatomic) BOOL lc_showBottomLine;

/* 偏移量 */
@property (nonatomic, assign) CGFloat lc_offset;

@property (strong, nonatomic, readonly) UIView *lc_bottomLineView;
//设置底部分割线类型
@property (assign, nonatomic) LCBottomLineType lc_bottomLineType;

- (void)lc_showBottomLineWithLineType:(LCBottomLineType)lineType;

@end

NS_ASSUME_NONNULL_END
