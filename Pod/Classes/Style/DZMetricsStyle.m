//
//  DZMetricsStyle.m
//  Pods
//
//  Created by stonedong on 15/8/8.
//
//

#import "DZMetricsStyle.h"

@implementation DZMetricsStyle

- (instancetype) initWithMetrics:(UIBarMetrics)metrics
{
    self = [super init];
    if (!self) {
        return self;
    }
    _metrics = metrics;
    return self;
}

- (void) setMetrics:(UIBarMetrics)metrics
{
    _metrics = metrics;
    [self setAttributeNeedRefresh];
}

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
    if(_backgroundImage != backgroundImage) {
        _backgroundImage = backgroundImage;
        [self setAttributeNeedRefresh];
    }
}

- (void) setTitleVerticalPositionAdjustment:(CGFloat)titleVerticalPositionAdjustment
{
    _titleVerticalPositionAdjustment = titleVerticalPositionAdjustment;
    [self setAttributeNeedRefresh];
}

- (void) decorateView:(UIView *)aView
{
    [super decorateView:aView];
    if ([aView respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [(UINavigationBar*)aView setBackgroundImage:_backgroundImage forBarMetrics:_metrics];
    }
    if ([aView respondsToSelector:@selector(setTitleVerticalPositionAdjustment:forBarMetrics:)]) {
        [(UINavigationBar*)aView setTitleVerticalPositionAdjustment:_titleVerticalPositionAdjustment forBarMetrics:_metrics];
    }
}
- (void) copyAttributesWithStyle:(id)style
{
    DZBeginCopyAttribute(DZMetricsStyle)
    DZStyleCopyAttribute(backgroundImage)
    DZStyleCopyAttribute(metrics)
    DZStyleCopyAttribute(titleVerticalPositionAdjustment)
    DZFinishCopyAttribute
}

- (id) copyWithZone:(NSZone *)zone
{
    DZMetricsStyle* style = [super copyWithZone:zone];
    style.metrics = self.metrics;
    style.backgroundImage = self.backgroundImage;
    style.titleVerticalPositionAdjustment = self.titleVerticalPositionAdjustment;
    return style;
}
@end
