//
//  DZMetricsStyle.h
//  Pods
//
//  Created by stonedong on 15/8/8.
//
//

#import "DZStyle.h"

@interface DZMetricsStyle : DZStyle
@property (nonatomic, assign) UIBarMetrics metrics;
@property (nonatomic, strong) UIImage* backgroundImage;
@property (nonatomic, assign) CGFloat titleVerticalPositionAdjustment;
@end
