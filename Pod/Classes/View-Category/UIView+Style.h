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
#import "DZButtonStyle.h"
#import "DZPageControlStyle.h"
#import "DZTextFieldStyle.h"
#import "DZTextViewStyle.h"
#import "DZSwitchStyle.h"
#import "DZSegementStyle.h"
@interface UIView (Style)
- (void) registreStyleClass:(Class)cla;
@property (nonatomic, copy) DZViewStyle* style;
@end

@interface UIButton (Style)
@property (nonatomic, copy) DZButtonStyle* style;
@end

@interface UILabel (Style)
@property (nonatomic, copy) DZLabelStyle* style;
@end

@interface UISegmentedControl (Style)
@property (nonatomic, copy) DZSegementStyle* style;
@end

@interface UITextField (Style)
@property (nonatomic, copy) DZTextFieldStyle* style;
@end

@interface UITextView (Style)
@property (nonatomic, copy) DZTextViewStyle* style;
@end

@interface UISwitch (Style)
@property (nonatomic, copy) DZSwitchStyle* style;
@end

@interface UIPageControl (Style)
@property (nonatomic, copy) DZPageControlStyle* style;
@end