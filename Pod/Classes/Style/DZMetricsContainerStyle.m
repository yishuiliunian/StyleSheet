//
//  DZMetricsContainerStyle.m
//  Pods
//
//  Created by stonedong on 15/8/8.
//
//

#import "DZMetricsContainerStyle.h"

@implementation DZMetricsContainerStyle
@synthesize defualtMetricsStyle = _defualtMetricsStyle;
@synthesize compactMetricStyle = _compactMetricStyle;
@synthesize landscapePhoneMetricStyle = _landscapePhoneMetricStyle;
@synthesize landscapePhonePromptMetricStyle = _landscapePhonePromptMetricStyle;
IMP_ZERO_STYLE

- (void) setDefualtMetricsStyle:(DZMetricsStyle *)defualtMetricsStyle
{
    if (_defualtMetricsStyle != defualtMetricsStyle) {
        [_defualtMetricsStyle unInstallOnViews:self.linkedViews];
        _defualtMetricsStyle = [defualtMetricsStyle copy];
        [_defualtMetricsStyle installOnViews:self.linkedViews];
        [self setAttributeNeedRefresh];
    }
}

- (DZMetricsStyle*) defualtMetricsStyle
{
    if (!_defualtMetricsStyle) {
        _defualtMetricsStyle = [[DZMetricsStyle zeroStyle] copy];
        [_defualtMetricsStyle installOnViews:self.linkedViews];
    }
    return _defualtMetricsStyle;
}

- (void) setCompactMetricStyle:(DZMetricsStyle *)compactMetricStyle
{
    if (_compactMetricStyle != compactMetricStyle) {
        [_compactMetricStyle unInstallOnViews:self.linkedViews];
        _compactMetricStyle = [compactMetricStyle copy];
        [_compactMetricStyle installOnViews:self.linkedViews];
        [self setAttributeNeedRefresh];
    }
}

#define IMP_Object_Style(BigName, littleName) \
- (DZMetricsStyle*) littleName \
{ \
    if (!_##littleName) { \
        _##littleName  = [[DZMetricsStyle zeroStyle] copy]; \
        [_##littleName installOnViews:self.linkedViews]; \
    } \
    return _##littleName; \
}

IMP_Object_Style(compactMetricStyle, compactMetricStyle)

@end

