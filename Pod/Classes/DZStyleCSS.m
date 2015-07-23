//
//  DZStyleCSS.m
//  DZStyle
//
//  Created by baidu on 15/7/23.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZStyleCSS.h"
#import <objc/runtime.h>
#import "DZButtonStyle.h"
#import "DZLabelStyle.h"
DZStyle* DZStyleFactory(UIView* aView)
{
    if (!aView) {
        return nil;
    }
    if ([aView isKindOfClass:[UIButton class]]) {
        return [DZButtonStyle zeroStyle];
    } else if ([aView isKindOfClass:[UILabel class]])
    {
        return [DZLabelStyle zeroStyle];
    } else {
        return [DZViewStyle zeroStyle];
    }
}




IMP_SHARE_VIEW_STYLE(DefaultStyle,
                     style.backgroundColor = [UIColor redColor];
                     style.cornerRedius = 11;
                     style.borderColor = [UIColor blackColor];
                     style.borderWidth = 2;
                     )

