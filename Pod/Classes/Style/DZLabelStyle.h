//
//  DZLabelStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#import "DZTextStyle.h"

#define DZLabelStyleMake(initCode) DZStyleMake(initCode, DZLabelStyle)
#define IMP_SHARE_LABEL_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZLabelStyle)
#define EXTERN_SHARE_LABEL_STYLE(name)           EXTERN_SHARE_STYLE(name, DZLabelStyle);



@interface DZLabelStyle : DZViewStyle
@property (nonatomic, copy) DZTextStyle* textStyle;
@property (nonatomic, strong) UIColor* highlightedTextColor;
@property (nonatomic, strong) UIColor* shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic)         CGFloat adjustsFontSizeToFitWidth;
@property (nonatomic, assign) UITextAlignment textAlignment;
@end
