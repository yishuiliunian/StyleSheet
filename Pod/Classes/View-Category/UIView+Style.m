//
//  UIView+Style.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "UIView+Style.h"
#import "DZStyle.h"
#import <objc/runtime.h>
#import "DZStyleCSS.h"

static void* kDZStyleKey = &kDZStyleKey;
@implementation UIView (Style)

- (void) __storeStyle:(DZStyle*)copyedStyle
{
    objc_setAssociatedObject(self, kDZStyleKey, copyedStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [copyedStyle installOnView:self];
    [copyedStyle decorateView:self];
}
- (void) setStyle:(DZStyle *)style
{
    id oldStyle = [self style];
    if (oldStyle) {
        [oldStyle unInstallOnView:self];
    }
    DZStyle* copyedStyle = [style copy];
    [self __storeStyle:copyedStyle];

}
- (DZStyle*) style
{
    DZStyle* style =  objc_getAssociatedObject(self, kDZStyleKey);
    if (!style) {
        style = [DZStyleFactory(self) copy];
        [self __storeStyle:style];
    }
    return style;
}
@end
