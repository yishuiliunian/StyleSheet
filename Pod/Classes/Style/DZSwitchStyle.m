//
//  DZSwitchStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZSwitchStyle.h"

@implementation DZSwitchStyle
IMP_ZERO_STYLE

- (void) setTintColor:(UIColor *)tintColor
{
    if (_tintColor != tintColor) {
        _tintColor = tintColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setThumbTintColor:(UIColor *)thumbTintColor
{
    if (_thumbTintColor != thumbTintColor) {
        _thumbTintColor = thumbTintColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setOnTintColor:(UIColor *)onTintColor
{
    if (_onTintColor != onTintColor) {
        _onTintColor = onTintColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UISwitch class]]) {
        return;
    }
    UISwitch* sw = (UISwitch*)aView;
    sw.onTintColor = self.onTintColor;
    sw.tintColor = self.tintColor;
    sw.thumbTintColor = self.thumbTintColor;
}
- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZSwitchStyle)
    DZStyleCopyAttribute(tintColor)
    DZStyleCopyAttribute(onTintColor)
    DZStyleCopyAttribute(thumbTintColor)
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZSwitchStyle* style = [super copyWithZone:zone];
    style.tintColor = self.tintColor;
    style.thumbTintColor = self.thumbTintColor;
    style.onTintColor = self.onTintColor;
    return style;
}
@end
