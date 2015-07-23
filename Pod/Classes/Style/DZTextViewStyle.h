//
//  DZTextViewStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"

#define DZTextViewStyleMake(initCode)               DZStyleMake(initCode, DZTextViewStyle)
#define IMP_SHARE_TEXTVIEW_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZTextViewStyle)
#define EXTERN_SHARE_TEXTVIEW_STYLE(name)           EXTERN_SHARE_STYLE(name, DZTextViewStyle);


@interface DZTextViewStyle : DZViewStyle

@end
