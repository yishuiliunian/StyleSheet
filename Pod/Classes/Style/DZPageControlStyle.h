//
//  DZPageControlStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#define DZPageControlStyleMake(initCode)                DZStyleMake           (initCode,  DZPageControlStyle                      )
#define IMP_SHARE_PAGE_CONTROL_STYLE(name , initCode)   IMP_SHARE_STYLE       (name ,     initCode,             DZPageControlStyle)
#define EXTERN_SHARE_PAGE_CONTROL_STYLE(name)           EXTERN_SHARE_STYLE    (name,      DZPageControlStyle                    );
@interface DZPageControlStyle : DZViewStyle

@end
