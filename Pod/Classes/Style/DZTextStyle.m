//
//  DZTextStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZTextStyle.h"

@implementation DZTextStyle
IMP_ZERO_STYLE
- (void) setTextColor:(UIColor *)textColor
{
    if (_textColor != textColor) {
        _textColor = textColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setFont:(UIFont *)font
{
    if (_font != font) {
        _font = font;
        [self setAttributeNeedRefresh];
    }
}

- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if ([aView respondsToSelector:@selector(setFont:)]) {
        [aView performSelector:@selector(setFont:) withObject:self.font];
    }
    
    if ([aView respondsToSelector:@selector(setTextColor:)]) {
        [aView performSelector:@selector(setTextColor:) withObject:self.textColor];
    }
}
- (id) copyWithZone:(NSZone *)zone
{
    DZTextStyle* style = [super copyWithZone:zone];
    style.font = self.font;
    style.textColor = self.textColor;
    return style;
}
@end
