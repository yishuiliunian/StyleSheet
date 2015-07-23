//
//  DZSegementStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZViewStyle.h"
#define DZSegementStyleMake(initCode)               DZStyleMake           (initCode,  DZSegementStyle                      )
#define IMP_SHARE_SEGMENT_STYLE(name , initCode)    IMP_SHARE_STYLE       (name ,     initCode,             DZSegementStyle)
#define EXTERN_SHARE_SEGMENT_STYLE(name)            EXTERN_SHARE_STYLE    (name,      DZSegementStyle                    );
@interface DZSegementStyle : DZViewStyle

@end
