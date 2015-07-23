//
//  DZTextFieldStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#import "DZTextStyle.h"
#define DZTextFiledStyleMake(initCode) DZStyleMake(initCode, DZTextFieldStyle)
#define IMP_SHARE_TEXTFIELD_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZTextFieldStyle)
#define EXTERN_SHARE_TEXTFIELD_STYLE(name)           EXTERN_SHARE_STYLE(name, DZTextFieldStyle);

@interface DZTextFieldStyle : DZViewStyle
@property (nonatomic, copy) DZTextStyle* textStyle;
@end
