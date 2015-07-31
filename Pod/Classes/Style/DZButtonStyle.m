//
//  DZButtonStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZButtonStyle.h"

@implementation DZButtonStyle
IMP_ZERO_STYLE

- (void) setTextColorDisableState:(UIColor *)textColorDisableState
{
    if (_textColorDisableState!= textColorDisableState) {
        _textColorDisableState = textColorDisableState;
        [self setAttributeNeedRefresh];
    }
}

- (void) setTextColorNormalState:(UIColor *)textColorNormalState
{
    if (_textColorNormalState!= textColorNormalState) {
        _textColorNormalState = textColorNormalState;
        [self setAttributeNeedRefresh];
    }
}

- (void) setTextColorHighlightedState:(UIColor *)textColorHighlightedState
{
    if (_textColorHighlightedState != textColorHighlightedState) {
        _textColorHighlightedState = textColorHighlightedState;
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
    [btn setTitleColor:_textColorNormalState forState:UIControlStateNormal];
    [btn setTitleColor:_textColorDisableState forState:UIControlStateDisabled];
    [btn setTitleColor:_textColorHighlightedState forState:UIControlStateHighlighted];
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZButtonStyle)
    DZStyleCopyAttribute(textColorNormalState)
    DZStyleCopyAttribute(textColorDisableState)
    DZStyleCopyAttribute(textColorHighlightedState)
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZButtonStyle* style = [super copyWithZone:zone];
    style.textColorHighlightedState = self.textColorHighlightedState;
    style.textColorNormalState = self.textColorNormalState;
    style.textColorDisableState = self.textColorDisableState;
    return style;
}

@end