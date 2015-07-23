//
//  DZTextStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZStyle.h"

#define DZTextStyleMake(initCode)                   DZStyleMake           (initCode,  DZTextStyle                      )
#define IMP_SHARE_TEXT_STYLE(name , initCode)       IMP_SHARE_STYLE       (name ,     initCode,             DZTextStyle)
#define EXTERN_SHARE_TEXT_STYLE(name)               EXTERN_SHARE_STYLE    (name,      DZTextStyle                    );


@interface DZTextStyle : DZStyle
@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) UIColor* textColor;
@end
