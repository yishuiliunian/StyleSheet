//
//  DZViewStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#import <objc/runtime.h>

void DZSwzzingMethod(Class cla, SEL originSEL, SEL swizzSEL) {
    Method originMethod = class_getInstanceMethod(cla, originSEL);
    Method swizzledMethod = class_getInstanceMethod(cla, swizzSEL );
    method_exchangeImplementations(originMethod, swizzledMethod);
}

@interface UIView (StyleBackground)
@property (nonatomic, strong) UIImage* styleBackgroundImage;
@property (nonatomic, strong) UIImageView* styleBackgoundImageView;
@end

static void* kStyleBackgoundImage = &kStyleBackgoundImage;
static void* kStyleBackgoundImageView = &kStyleBackgoundImageView;
@implementation UIView (StyleBackground)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DZSwzzingMethod([self class], @selector(layoutSubviews), @selector(__styleLayoutSubViews));
        DZSwzzingMethod([self class], @selector(setFrame:), @selector(__styleSetFrame:));
    });
}

- (void) setStyleBackgroundImage:(UIImage *)styleBackgroundImage
{
    objc_setAssociatedObject(self, kStyleBackgoundImage, styleBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (styleBackgroundImage) {
        self.styleBackgoundImageView.image = styleBackgroundImage;
    } else {
        UIImageView* imageView = objc_getAssociatedObject(self, kStyleBackgoundImageView);
        [imageView removeFromSuperview];
        self.styleBackgoundImageView = nil;
    }
}

- (void) setStyleBackgoundImageView:(UIImageView *)styleBackgoundImageView
{
    objc_setAssociatedObject(self, kStyleBackgoundImageView, styleBackgoundImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView*) styleBackgoundImageView
{
    UIImageView* imageView = objc_getAssociatedObject(self, kStyleBackgoundImageView);
    if (!imageView) {
        imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeTopLeft;
        imageView.layer.masksToBounds = YES;
        [self.superview insertSubview:imageView belowSubview:self];
        self.styleBackgoundImageView = imageView;
        [self setNeedsLayout];
    }
    return imageView;
}

- (UIImage*) styleBackgroundImage
{
    return objc_getAssociatedObject(self, kStyleBackgoundImage);
}

- (void) __styleSetFrame:(CGRect)frame
{
    [self __styleSetFrame:frame];
    UIImageView* imageView = objc_getAssociatedObject(self, kStyleBackgoundImageView);
    if (imageView && !CGRectIsNull(frame)) {
        imageView.frame = frame;
    }
    
}
- (void) __styleLayoutSubViews
{
    [self __styleLayoutSubViews];
    UIImageView* imageView = objc_getAssociatedObject(self, kStyleBackgoundImageView);
    if (imageView) {
        imageView.frame = self.frame;
    }
    
}

@end

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
- (void) setStyleBackgroundImage:(UIImage *)styleBackgroundImage
{
    if (_styleBackgroundImage != styleBackgroundImage) {
        _styleBackgroundImage = styleBackgroundImage;
        [self setAttributeNeedRefresh];
    }
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
    aView.styleBackgroundImage = _styleBackgroundImage;
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
    DZStyleCopyAttribute(styleBackgroundImage);
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
    style.styleBackgroundImage = self.styleBackgroundImage;
    return style;
}

@end
