//
//  DZLabelStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZLabelStyle.h"

@implementation DZLabelStyle
IMP_ZERO_STYLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTextStyle:(DZTextStyle*)[DZTextStyle zeroStyle]];
        _clipsToBounds = NO;
    }
    return self;
}
- (void) setTextAlignment:(UITextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    [self setAttributeNeedRefresh];
}

- (void) setHighlightedTextColor:(UIColor *)highlightedTextColor
{
    if (_highlightedTextColor != highlightedTextColor) {
        _highlightedTextColor = highlightedTextColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setShadowColor:(UIColor *)shadowColor
{
    if (_shadowColor != shadowColor) {
        _shadowColor= shadowColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    [self setAttributeNeedRefresh];
}

- (void) setAdjustsFontSizeToFitWidth:(CGFloat)adjustsFontSizeToFitWidth
{
    _adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    [self setAttributeNeedRefresh];
}
- (void) setTextStyle:(DZTextStyle *)textStyle
{
    [_textStyle unInstallOnViews:self.linkedViews];
    _textStyle = [textStyle copy];
    [_textStyle installOnViews:self.linkedViews];
    [_textStyle setAttributeNeedRefresh];
}

- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UILabel class]]) {
        return;
    }
    UILabel* label = (UILabel*)aView;
    label.textAlignment = self.textAlignment;
    [self.textStyle decorateView:aView];
    label.highlightedTextColor = _highlightedTextColor;
    label.shadowColor = _shadowColor;
    label.shadowOffset = _shadowOffset;
    label.adjustsFontSizeToFitWidth = _adjustsFontSizeToFitWidth;
    
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZLabelStyle);
    DZStyleCopyAttribute(highlightedTextColor)
    DZStyleCopyAttribute(shadowColor)
    DZStyleCopyAttribute(shadowOffset)
    DZStyleCopyAttribute(adjustsFontSizeToFitWidth)
    DZStyleCopyAttribute(textAlignment)
    if ([origin respondsToSelector:@selector(textStyle)]) {
        self.textStyle = [origin.textStyle copy];
    }
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZLabelStyle* style = [super copyWithZone:zone];
    style.textAlignment = self.textAlignment;
    style.textStyle = [[self textStyle] copy];
    style.highlightedTextColor = _highlightedTextColor;
    style.shadowColor = _shadowColor;
    style.shadowOffset= _shadowOffset;
    style.adjustsFontSizeToFitWidth = _adjustsFontSizeToFitWidth;
    return style;
}
@end
