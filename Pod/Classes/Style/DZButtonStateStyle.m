//
//  DZButtonStateStyle.m
//  Pods
//
//  Created by baidu on 15/8/6.
//
//

#import "DZButtonStateStyle.h"

@implementation DZButtonStateStyle
IMP_ZERO_STYLE

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _state = UIControlStateNormal;
    return self;
}

- (void) setTitleColor:(UIColor *)titleColor
{
    if (_titleColor != titleColor) {
        _titleColor = titleColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setTitleShadowColor:(UIColor *)titleShadowColor
{
    if (_titleShadowColor != titleShadowColor) {
        _titleShadowColor = titleShadowColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
    if (_backgroundImage != backgroundImage) {
        _backgroundImage = backgroundImage;
        [self setAttributeNeedRefresh];
    }
}


- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UIButton class]]) {
        return;
    }
    UIButton* btn = (UIButton*)aView;
    [btn setTitleShadowColor:_titleShadowColor forState:_state];
    [btn setTitleColor:_titleColor forState:_state];
    [btn setBackgroundImage:_backgroundImage forState:_state];
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZButtonStateStyle)
    DZStyleCopyAttribute(titleColor)
    DZStyleCopyAttribute(titleShadowColor)
    DZStyleCopyAttribute(backgroundImage)
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZButtonStateStyle* style = [super copyWithZone:zone];
    style.backgroundImage = self.backgroundImage;
    style.titleShadowColor = self.titleShadowColor;
    style.titleColor = self.titleColor;
    return style;
}

@end
