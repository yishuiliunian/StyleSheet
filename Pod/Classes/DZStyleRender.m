//
//  DZStyleRender.m
//  Pods
//
//  Created by baidu on 15/7/31.
//
//

#import "DZStyleRender.h"
#import <QuartzCore/QuartzCore.h>
#import "DZStyle.h"

@interface DZStyleRender ()
{
    CADisplayLink* _displayLink;
    NSPointerArray* _needRenderStyle;
}
@end


@implementation DZStyleRender

- (void) dealloc
{
    [_displayLink invalidate];
}


+ (DZStyleRender*) shareRender
{
    static DZStyleRender* render;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        render = [DZStyleRender new];
    });
    return render;
}


- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplay:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    _needRenderStyle = [NSPointerArray weakObjectsPointerArray];
    return self;
}

- (void) handleDisplay:(CADisplayLink*)link
{
    if (_needRenderStyle.count == 0) {
        return;
    }
    for (DZStyle * style in _needRenderStyle.allObjects) {
        [style renderAllLinedViews];
    }
    _needRenderStyle = [NSPointerArray weakObjectsPointerArray];
}

- (BOOL) hasStyle:(DZStyle*)style
{
    NSAssert([NSThread isMainThread], @"请在主线程运行StyleSheet");
    NSArray * allStyles = [[_needRenderStyle allObjects] copy];
    for (DZStyle * style in allStyles) {
        if (style == style) {
            return YES;
        }
    }
    return NO;
}

- (void) addNeedRenderStyle:(DZStyle*)style
{
    if ([self hasStyle:style]) {
        return;
    }
    if (!style) {
        return;;
    }
    [_needRenderStyle addPointer:(__bridge void*)style];
}

@end
