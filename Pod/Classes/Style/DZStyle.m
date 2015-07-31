//
//  DZStyle.m
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZStyle.h"
#import "UIView+Style.h"
#import "DZStyleRender.h"
@implementation DZStyle
IMP_ZERO_STYLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        _childStyle = [NSMutableArray new];
    }
    return self;
}
- (void) copyAttributesWithStyle:(id)style
{
    if (![style isKindOfClass:[DZStyle class]]) {
        return ;
    }
    return;
}

- (void) decorateView:(UIView *)aView
{
    
}

- (id) copyWithZone:(NSZone *)zone
{
    DZStyle* style = [[[self class] allocWithZone:zone] init];
    return style;
}

- (void) installOnView:(UIView *)aView
{
    _linkedView = aView;
}

- (void) unInstallOnView:(UIView *)aView
{
    _linkedView = nil;
}

- (void) setAttributeNeedRefresh
{
    if (self.linkedView) {
        [DZShareStypeRender addNeedRenderStyle:self];
    }
}


- (void) addChildStyle:(DZStyle*)style
{
    if (style) {
        [_childStyle addObject:style];
    }
}

- (void) removeChildStyle:(DZStyle*)style
{
    [_childStyle removeObject:style];
}

- (void) removeAllChildStyle
{
    [_childStyle removeAllObjects];
}
@end
