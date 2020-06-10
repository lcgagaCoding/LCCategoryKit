//
//  UITableViewCell+SeperatorLine.m
//  YCCategoryModule
//
//  Created by 刘成 on 2019/5/25.
//

#import "UITableViewCell+SeperatorLine.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

static char kAssociatedTypeKey;
static char kAssociatedOffsetKey;


@implementation UITableViewCell (SeperatorLine)
@dynamic yc_showBottomLine;
@dynamic yc_offset;

- (void)setYc_showBottomLine:(BOOL)yc_showBottomLine {
    
    if (yc_showBottomLine) {
        if ([self yc_bottomLineView].superview) return;
        [self.contentView addSubview:[self yc_bottomLineView]];
        [[self yc_bottomLineView] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(self.yc_offset);
            make.right.equalTo(self.contentView).offset(-self.yc_offset);
            make.height.equalTo(@(1/[UIScreen mainScreen].scale));
        }];
    } else {
        [[self yc_bottomLineView] removeFromSuperview];
    }
}

- (BOOL)yc_showBottomLine {
    return !([self yc_bottomLineView].superview == nil);
}

- (void)setYc_bottomLineType:(YCBottomLineType)yc_bottomLineType {
    objc_setAssociatedObject(self, &kAssociatedTypeKey, @(yc_bottomLineType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yc_showBottomLine) {
        [[self yc_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.yc_bottomLineType == YCBottomLineTypeZero) {
                make.left.equalTo(self.contentView);
                make.right.equalTo(self.contentView);
            } else if (self.yc_bottomLineType == YCBottomLineTypeLeftInterspace) {
                make.left.equalTo(self.contentView).offset(self.yc_offset);
                make.right.equalTo(self.contentView).offset(0);
            } else {
                make.left.equalTo(self.contentView).offset(self.yc_offset);
                make.right.equalTo(self.contentView).offset(-self.yc_offset);
            }
        }];
    }else{
        [[self yc_bottomLineView] removeFromSuperview];
    }
}

- (YCBottomLineType)yc_bottomLineType {
    return [objc_getAssociatedObject(self, &kAssociatedTypeKey) integerValue];
}

- (UIView *)yc_bottomLineView {
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [self yc_generateSeperatorView], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (UIView *)yc_generateSeperatorView {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    return line;
}

- (void)setYc_offset:(CGFloat)yc_offset {
    objc_setAssociatedObject(self, &kAssociatedOffsetKey, @(yc_offset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)yc_offset {
    if (!objc_getAssociatedObject(self, &kAssociatedOffsetKey)) {
        objc_setAssociatedObject(self, &kAssociatedOffsetKey, @(14), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return [objc_getAssociatedObject(self, &kAssociatedOffsetKey) integerValue];
}


- (void)yc_showBottomLineWithLineType:(YCBottomLineType)lineType {
    
    self.yc_showBottomLine = YES;
    self.yc_bottomLineType = lineType;
}

@end
