//
//  UIView+Style.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZViewStyle.h"
#import "DZButtonStyle.h"
#import "DZLabelStyle.h"
@interface UIView (Style)
@property (nonatomic, copy) DZViewStyle* style;
@end

@interface UIButton (Style)
@property (nonatomic, copy) DZButtonStyle* style;
@end

@interface UILabel (Style)
@property (nonatomic, copy) DZLabelStyle* style;
@end
