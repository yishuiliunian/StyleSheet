//
//  DZButtonStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZButtonStyle.h"

@interface DZButtonStyle   ()
{
}
@end

@implementation DZButtonStyle
@synthesize normalStyle = _normalStyle;
@synthesize disabledStyle = _disabledStyle;
@synthesize hightlightedStyle = _hightlightedStyle;
@synthesize selectedStyle = _selectedStyle;
IMP_ZERO_STYLE

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    return self;
}

- (DZButtonStateStyle*) normalStyle
{
    if (!_normalStyle) {
        _normalStyle = [[DZButtonStateStyle zeroStyle] copy];
        _normalStyle.state = UIControlStateNormal;
    }
    return _normalStyle;
}


- (DZButtonStateStyle*) disabledStyle
{
    if (!_disabledStyle) {
        _disabledStyle = [[DZButtonStateStyle zeroStyle] copy];
        _disabledStyle.state = UIControlStateDisabled;
    }
    return _disabledStyle;
}

- (DZButtonStateStyle*) hightlightedStyle
{
    if (!_hightlightedStyle) {
        _hightlightedStyle = [[DZButtonStateStyle zeroStyle] copy];
        _hightlightedStyle.state = UIControlStateHighlighted;
    }
    return _hightlightedStyle;
}


- (DZButtonStateStyle*) selectedStyle
{
    if (!_selectedStyle) {
        _selectedStyle = [[DZButtonStateStyle zeroStyle]copy];
        _selectedStyle.state = UIControlStateSelected;
    }
    return _selectedStyle;
}

- (void) setSelectedStyle:(DZButtonStateStyle *)selectedStyle
{
    if (_selectedStyle != selectedStyle) {
        _selectedStyle = [selectedStyle copy];
        _selectedStyle.state = UIControlStateSelected;
        [selectedStyle setAttributeNeedRefresh];
    }
}

-(void) setNormalStyle:(DZButtonStateStyle *)normalStyle
{
    if (_normalStyle != normalStyle) {
        _normalStyle = [normalStyle copy];
        _normalStyle.state = UIControlStateNormal;
        [self setAttributeNeedRefresh];
    }
}

- (void) setDisabledStyle:(DZButtonStateStyle *)disabledStyle
{
    if (_disabledStyle != disabledStyle) {
        _disabledStyle = [disabledStyle copy];
        _disabledStyle.state = UIControlStateDisabled;
        [self setAttributeNeedRefresh];
    }
}

- (void) setLabelFont:(UIFont *)labelFont
{
    if (_labelFont != labelFont) {
        _labelFont = labelFont;
        [self setAttributeNeedRefresh];
    }
}
- (void) setHightlightedStyle:(DZButtonStateStyle *)hightlightedStyle
{
    if (_hightlightedStyle != hightlightedStyle) {
        _hightlightedStyle = [hightlightedStyle copy];
        _hightlightedStyle.state = UIControlStateHighlighted;
        [self setAttributeNeedRefresh];
    }
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZButtonStyle)
    DZStyleCopyAttribute_Copy(disabledStyle)
    DZStyleCopyAttribute_Copy(normalStyle)
    DZStyleCopyAttribute_Copy(hightlightedStyle)
    DZStyleCopyAttribute_Copy(selectedStyle);
    DZStyleCopyAttribute_Copy(labelFont);
    DZFinishCopyAttribute
}


- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UIButton class]]) {
        return;
    }
    UIButton* btn = (UIButton*)aView;
    [self.disabledStyle decorateView:aView];
    [self.normalStyle decorateView:aView];
    [self.hightlightedStyle decorateView:aView];
    [self.selectedStyle decorateView:aView];
    if (_labelFont) {
        btn.titleLabel.font = self.labelFont;
    }
}

- (id) copyWithZone:(NSZone *)zone
{
    DZButtonStyle* style = [super copyWithZone:zone];
    style.hightlightedStyle = [self.hightlightedStyle copy];
    style.normalStyle = [self.normalStyle copy];
    style.disabledStyle = [self.disabledStyle copy];
    style.selectedStyle = [self.selectedStyle copy];
    style.labelFont = self.labelFont;
    return style;
}

@end