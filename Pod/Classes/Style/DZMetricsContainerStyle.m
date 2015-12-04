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
        [_defualtMetricsStyle unInstallOnView:self.linkedView];
        _defualtMetricsStyle = [defualtMetricsStyle copy];
        [_defualtMetricsStyle installOnView:self.linkedView];
        [self setAttributeNeedRefresh];
    }
}

- (DZMetricsStyle*) defualtMetricsStyle
{
    if (!_defualtMetricsStyle) {
        _defualtMetricsStyle = [[DZMetricsStyle zeroStyle] copy];
        [_defualtMetricsStyle installOnView:self.linkedView];
    }
    return _defualtMetricsStyle;
}

- (void) setCompactMetricStyle:(DZMetricsStyle *)compactMetricStyle
{
    if (_compactMetricStyle != compactMetricStyle) {
        [_compactMetricStyle unInstallOnView:self.linkedView];
        _compactMetricStyle = [compactMetricStyle copy];
        [_compactMetricStyle installOnView:self.linkedView];
        [self setAttributeNeedRefresh];
    }
}

#define IMP_Object_Style(BigName, littleName) \
- (DZMetricsStyle*) littleName \
{ \
    if (!_##littleName) { \
        _##littleName  = [[DZMetricsStyle zeroStyle] copy]; \
        [_##littleName installOnView:self.linkedView]; \
    } \
    return _##littleName; \
}

IMP_Object_Style(compactMetricStyle, compactMetricStyle)

@end

