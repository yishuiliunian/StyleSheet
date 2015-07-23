//
//  DZSwitchStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"

#define DZSwitchStyleMake(initCode)               DZStyleMake           (initCode,  DZSwitchStyle               )
#define IMP_SHARE_SWITCH_STYLE(name , initCode)   IMP_SHARE_STYLE       (name ,     initCode,       DZSwitchStyle)
#define EXTERN_SHARE_SWITCH_STYLE(name)           EXTERN_SHARE_STYLE    (name,      DZSwitchStyle               );

@interface DZSwitchStyle : DZViewStyle

@end
