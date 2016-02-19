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
    DZFinishCopyAttribute
}


- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UIButton class]]) {
        return;
    }
    [self.disabledStyle decorateView:aView];
    [self.normalStyle decorateView:aView];
    [self.hightlightedStyle decorateView:aView];
}

- (id) copyWithZone:(NSZone *)zone
{
    DZButtonStyle* style = [super copyWithZone:zone];
    style.hightlightedStyle = [self.hightlightedStyle copy];
    style.normalStyle = [self.normalStyle copy];
    style.disabledStyle = [self.disabledStyle copy];
    return style;
}

@end