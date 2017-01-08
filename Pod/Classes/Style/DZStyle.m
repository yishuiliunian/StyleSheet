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

@interface DZStyle ()
{
    NSPointerArray * _linkedWeakViews;
}
@end


@implementation DZStyle
@synthesize linkedViews = _linkedViews;
IMP_ZERO_STYLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        _childStyle = [NSMutableArray new];
    }
    _linkedWeakViews = [NSPointerArray weakObjectsPointerArray];
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
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
}

- (id) copyWithZone:(NSZone *)zone
{
    DZStyle* style = [[[self class] allocWithZone:zone] init];
    return style;
}

- (void) installOnView:(UIView *)aView
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    if (!aView) {
        return;
    }
    for (UIView *view in _linkedWeakViews.allObjects) {
        if (aView == view) {
            return;
        }
    }
    [_linkedWeakViews addPointer:(__bridge void*)aView];
}

- (void) unInstallOnView:(UIView *)aView
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    if (!aView) {
        return;
    }
    NSPointerArray * coped = [_linkedWeakViews copy];
    for (int i = 0; i < coped.count; ++i) {
        if (aView == [coped pointerAtIndex:i]) {
            [_linkedWeakViews removePointerAtIndex:i];
            return;
        }
    }
}

- (void)installOnViews:(NSArray *)views {
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    if (views.count == 0) {
        return;
    }

    NSArray * allExistObject = [_linkedWeakViews allObjects];
    for (UIView * view in views) {
        if ([allExistObject containsObject:view]) {
            continue;
        } else {
            [_linkedWeakViews addPointer:(__bridge void*)view];
        }
    }
}

- (void)unInstallOnViews:(NSArray *)views {
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    if (views.count == 0) {
        return;
    }
    [_linkedWeakViews compact];
    for (id view in views) {
        NSArray * allExistObject = [_linkedWeakViews allObjects];
        if (allExistObject.count == 0) {
            break;
        }
        NSInteger  index = [allExistObject indexOfObject:view];
        if (index != NSNotFound) {
            [_linkedWeakViews removePointerAtIndex:index];
        }
    }
}

- (NSArray *)linkedViews {
    return _linkedWeakViews.allObjects;
}
- (void) setAttributeNeedRefresh
{
    if (self.linkedViews.count) {
        [DZShareStypeRender addNeedRenderStyle:self];
    }
}

- (void)renderAllLinedViews {
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    for (UIView *   view  in _linkedWeakViews.allObjects) {
        [self decorateView:view];
    }
}

- (void) addChildStyle:(DZStyle*)style
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    if (style) {
        [_childStyle addObject:style.copy];
    }
}

- (void) removeChildStyle:(DZStyle*)style
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    [_childStyle removeObject:style.copy];
}

- (void) removeAllChildStyle
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    [_childStyle removeAllObjects];
}
@end
