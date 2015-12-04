//
//  DZNavigationBarStyle.h
//  Pods
//
//  Created by stonedong on 15/8/8.
//
//

#import "DZViewStyle.h"
#import "DZMetricsStyle.h"
@interface DZNavigationBarStyle : DZViewStyle
@property (nonatomic, assign) UIBarStyle barStyle;
@property (nonatomic, strong) UIColor* barTintColor;
@property (nonatomic, strong) UIImage* shadowImage;
@property (nonatomic, assign) BOOL translucent;




@end
