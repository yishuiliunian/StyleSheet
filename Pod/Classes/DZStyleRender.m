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
@interface DZWeakLink : NSObject
@property (nonatomic, weak) NSObject* weakObject;
@end

@implementation DZWeakLink
@synthesize weakObject;
@end



@interface DZStyleRender ()
{
    CADisplayLink* _displayLink;
    NSMutableArray* _needRenderStyle;
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
    _needRenderStyle = [NSMutableArray new];
    return self;
}

- (void) handleDisplay:(CADisplayLink*)link
{
    if (_needRenderStyle.count == 0) {
        return;
    }
    for (DZWeakLink* link in _needRenderStyle) {
        DZStyle* style = (DZStyle*)link.weakObject;
        [style decorateView:style.linkedView];
    }
    [_needRenderStyle removeAllObjects];
}

- (BOOL) hasStyle:(DZStyle*)style
{
    for (DZWeakLink* link  in _needRenderStyle) {
        if (link.weakObject == style) {
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
    DZWeakLink* link = [DZWeakLink new];
    link.weakObject = style;
    [_needRenderStyle addObject:link];
}

@end
