//
//  DZViewStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#import <objc/runtime.h>


@implementation DZViewStyle
IMP_ZERO_STYLE
- (instancetype)init
{
    self = [super init];
    if (self) {
        _alpha = 1.0;
        _clearsContextBeforeDrawing = YES;
        _clipsToBounds = YES;
    }
    return self;
}


- (void) setBorderColor:(UIColor *)borderColor
{
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setBackgroundColor:(UIColor *)backgroundColor
{
    if (_backgroundColor != backgroundColor) {
        _backgroundColor = backgroundColor;
        [self setAttributeNeedRefresh];
    }
}

- (void) setAlpha:(CGFloat)alpha
{
    _alpha = alpha;
    [self setAttributeNeedRefresh];
}
- (void) setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    [self setAttributeNeedRefresh];
}

- (void) setCornerRedius:(CGFloat)cornerRedius
{
    _cornerRedius = cornerRedius;
    [self setAttributeNeedRefresh];
}


- (void) setClipsToBounds:(BOOL)clipsToBounds
{
    _clipsToBounds = clipsToBounds;
    [self setAttributeNeedRefresh];
}

- (void) setClearsContextBeforeDrawing:(BOOL)clearsContextBeforeDrawing
{
    _clearsContextBeforeDrawing = clearsContextBeforeDrawing;
    [self setAttributeNeedRefresh];
}

- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if ([aView respondsToSelector:@selector(setBackgroundColor:)]) {
        [aView setBackgroundColor:self.backgroundColor];
    }
    if ([aView respondsToSelector:@selector(layer)]) {
        aView.layer.cornerRadius = self.cornerRedius;
        aView.layer.borderWidth = self.borderWidth;
        aView.layer.borderColor = self.borderColor.CGColor;
    }
    aView.alpha = self.alpha;
    if (aView.clipsToBounds != self.clipsToBounds) {
        aView.clipsToBounds = self.clipsToBounds;
    }
    aView.clearsContextBeforeDrawing = self.clearsContextBeforeDrawing;
}

- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZViewStyle)
    DZStyleCopyAttribute(cornerRedius)
    DZStyleCopyAttribute(borderWidth)
    DZStyleCopyAttribute(backgroundColor)
    DZStyleCopyAttribute(borderColor)
    DZStyleCopyAttribute(alpha)
    DZStyleCopyAttribute(clipsToBounds)
    DZStyleCopyAttribute(clearsContextBeforeDrawing)
    DZFinishCopyAttribute
}
- (id) copyWithZone:(NSZone *)zone
{
    DZViewStyle* style = [super copyWithZone:zone];
    style.backgroundColor = self.backgroundColor;
    style.cornerRedius = self.cornerRedius;
    style.borderColor = self.borderColor;
    style.borderWidth = self.borderWidth;
    style.alpha = self.alpha;
    style.clipsToBounds = self.clipsToBounds;
    return style;
}

@end
