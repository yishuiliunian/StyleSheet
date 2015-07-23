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
static void* kDZStyleClass = &kDZStyleClass;
@implementation UIView (Style)

- (void) registreStyleClass:(Class)cla
{
    objc_setAssociatedObject(self, kDZStyleClass, cla, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Class) __styleClass
{
    if ([self isKindOfClass:[UIButton class]]) {
        return [DZButtonStyle class];
    } else if ([self isKindOfClass:[UILabel class]])
    {
        return [DZLabelStyle class];
    } else if ([self isKindOfClass:[UISegmentedControl class]])
    {
        return [DZSegementStyle class];
    }
    else if ([self isKindOfClass:[UIPageControl class]]) {
        return [DZPageControlStyle class];
    }
    else if ([self isKindOfClass:[DZTextFieldStyle class]]) {
        return [DZTextFieldStyle class];
    }
    else {
        Class cla = objc_getAssociatedObject(self, kDZStyleClass);
        if (cla) {
            return cla;
        }
        return [DZViewStyle class];
    }
}

- (DZStyle*) __zeroStyle
{
    DZStyle* style;
    Class cla = [self __styleClass];
    if ([(NSObject*)cla respondsToSelector:@selector(zeroStyle)]) {
        style = [[[self __styleClass] zeroStyle ] copy];
    }
    return style;
}
- (void) __storeStyle:(DZStyle*)copyedStyle
{
    objc_setAssociatedObject(self, kDZStyleKey, copyedStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [copyedStyle installOnView:self];
    [copyedStyle decorateView:self];

}
- (void) setStyle:(DZStyle *)style
{
    id oldStyle = objc_getAssociatedObject(self, kDZStyleKey);
    if (oldStyle) {
        [oldStyle unInstallOnView:self];
    }
    DZStyle* copyedStyle = [self  __zeroStyle] ;
    [copyedStyle copyAttributesWithStyle:style];
    [self __storeStyle:copyedStyle];

}

- (DZStyle*) style
{
    DZStyle* style =  objc_getAssociatedObject(self, kDZStyleKey);
    if (!style) {
        Class cla = [self __styleClass];
        if ([(NSObject*)cla respondsToSelector:@selector(zeroStyle)]) {
            style = [[[self __styleClass] zeroStyle ] copy];
            [self __storeStyle:style];
        }
    }
    return style;
}
@end
