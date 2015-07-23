//
//  DZTextFieldStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZTextFieldStyle.h"

@implementation DZTextFieldStyle
IMP_ZERO_STYLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTextStyle:(DZTextStyle*)[DZTextStyle zeroStyle]];
        _clipsToBounds = YES;
    }
    return self;
}

- (void) setTextStyle:(DZTextStyle *)textStyle
{
    [_textStyle unInstallOnView:self.linkedView];
    _textStyle = [textStyle copy];
    [_textStyle installOnView:self.linkedView];
    [_textStyle setAttributeNeedRefresh];
}


- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if (![aView isKindOfClass:[UITextField class]]) {
        return;
    }
    UITextField* textField = (UITextField*)aView;
    [self.textStyle decorateView:aView];
    
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZTextFieldStyle)
    if ([origin respondsToSelector:@selector(textStyle)]) {
        self.textStyle = [origin.textStyle copy];
    }
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZTextFieldStyle* style = [super copyWithZone:zone];
    style.textStyle = [[self textStyle] copy];
    return style;
}
@end
