//
//  DZButtonStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#import "DZButtonStateStyle.h"

#define DZButtonStyleMake(initCode) DZStyleMake(initCode, DZButtonStyle)
#define IMP_SHARE_BUTTON_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZButtonStyle)
#define EXTERN_SHARE_BUTTON_STYLE(name)           EXTERN_SHARE_STYLE(name, DZButtonStyle);

@interface DZButtonStyle : DZViewStyle
@property (nonatomic, copy) DZButtonStateStyle* normalStyle;
@property (nonatomic, copy) DZButtonStateStyle* disabledStyle;
@property (nonatomic, copy) DZButtonStateStyle* hightlightedStyle;
@property (nonatomic, copy) DZButtonStateStyle* selectedStyle;
@property (nonatomic, copy) UIFont* labelFont;
@end
