//
//  DZMetricsContainerStyle.h
//  Pods
//
//  Created by stonedong on 15/8/8.
//
//

#import "DZStyle.h"
#import "DZMetricsStyle.h"
@interface DZMetricsContainerStyle : DZStyle
@property (nonatomic, copy) DZMetricsStyle* defualtMetricsStyle;
@property (nonatomic, copy) DZMetricsStyle* compactMetricStyle;
@property (nonatomic, copy) DZMetricsStyle* landscapePhoneMetricStyle;
@property (nonatomic, copy) DZMetricsStyle* landscapePhonePromptMetricStyle;
@end
