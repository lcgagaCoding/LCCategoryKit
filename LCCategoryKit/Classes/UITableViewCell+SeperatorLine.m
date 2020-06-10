//
//  UITableViewCell+SeperatorLine.m
//  LCCategoryModule
//
//  Created by 刘成 on 2019/5/25.
//

#import "UITableViewCell+SeperatorLine.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

static char kAssociatedTypeKey;
static char kAssociatedOffsetKey;


@implementation UITableViewCell (SeperatorLine)
@dynamic lc_showBottomLine;
@dynamic lc_offset;

- (void)setlc_showBottomLine:(BOOL)lc_showBottomLine {
    
    if (lc_showBottomLine) {
        if ([self lc_bottomLineView].superview) return;
        [self.contentView addSubview:[self lc_bottomLineView]];
        [[self lc_bottomLineView] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(self.lc_offset);
            make.right.equalTo(self.contentView).offset(-self.lc_offset);
            make.height.equalTo(@(1/[UIScreen mainScreen].scale));
        }];
    } else {
        [[self lc_bottomLineView] removeFromSuperview];
    }
}

- (BOOL)lc_showBottomLine {
    return !([self lc_bottomLineView].superview == nil);
}

- (void)setlc_bottomLineType:(LCBottomLineType)lc_bottomLineType {
    objc_setAssociatedObject(self, &kAssociatedTypeKey, @(lc_bottomLineType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.lc_showBottomLine) {
        [[self lc_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.lc_bottomLineType == LCBottomLineTypeZero) {
                make.left.equalTo(self.contentView);
                make.right.equalTo(self.contentView);
            } else if (self.lc_bottomLineType == LCBottomLineTypeLeftInterspace) {
                make.left.equalTo(self.contentView).offset(self.lc_offset);
                make.right.equalTo(self.contentView).offset(0);
            } else {
                make.left.equalTo(self.contentView).offset(self.lc_offset);
                make.right.equalTo(self.contentView).offset(-self.lc_offset);
            }
        }];
    }else{
        [[self lc_bottomLineView] removeFromSuperview];
    }
}

- (LCBottomLineType)lc_bottomLineType {
    return [objc_getAssociatedObject(self, &kAssociatedTypeKey) integerValue];
}

- (UIView *)lc_bottomLineView {
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [self lc_generateSeperatorView], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (UIView *)lc_generateSeperatorView {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    return line;
}

- (void)setlc_offset:(CGFloat)lc_offset {
    objc_setAssociatedObject(self, &kAssociatedOffsetKey, @(lc_offset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)lc_offset {
    if (!objc_getAssociatedObject(self, &kAssociatedOffsetKey)) {
        objc_setAssociatedObject(self, &kAssociatedOffsetKey, @(14), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return [objc_getAssociatedObject(self, &kAssociatedOffsetKey) integerValue];
}


- (void)lc_showBottomLineWithLineType:(LCBottomLineType)lineType {
    
    self.lc_showBottomLine = YES;
    self.lc_bottomLineType = lineType;
}

@end
