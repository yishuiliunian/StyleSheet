//
//  DZStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IMP_ZERO_STYLE \
+ (DZStyle*) zeroStyle; \
{ \
static DZStyle* style = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
style = [[[self class] alloc] init]; \
\
}); \
return style; \
}



#define IMP_SHARE_STYLE(name , initCode, cla) \
cla* DZStyle##name(){ \
static cla* style = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
\
style = DZStyleMake(initCode, cla); \
}); \
return style; \
}

#define EXTERN_SHARE_STYLE(name, cla)  FOUNDATION_EXTERN cla* DZStyle##name();

#define DZBeginCopyAttribute(cla) \
cla* origin = (cla*)style; \
[super copyAttributesWithStyle:style]; \

#define DZFinishCopyAttribute  ;

#define DZStyleCopyAttribute(attr) \
if ([style respondsToSelector:@selector(attr)]) { \
self.attr = origin.attr; \
}


@interface DZStyle : NSObject <NSCopying>
{
    NSMutableArray* _childStyle;
}
@property (nonatomic, weak, readonly) UIView* linkedView;
/**
 *  标准的样式，采用空的默认样式
 *
 *  @return 空的默认样式
 */
+ (DZStyle*) zeroStyle;
/**
 *  用该模式渲染制定的View
 *
 *  @param aView 需要渲染的View
 */
- (void) decorateView:(UIView*)aView;

//
/**
 *  将该样式关联到制定的View，当样式改变的时候会及时改变该View的样式
 *
 *  @param aView 关联的View
 */
- (void) installOnView:(UIView*)aView;
/**
 *  取消关联
 *
 *  @param aView 取消关联View
 */
- (void) unInstallOnView:(UIView*)aView;
//

/**
 *  当样式的属性改变的时候，调用该函数，会重新进行渲染。
 */
- (void) setAttributeNeedRefresh;

- (void) copyAttributesWithStyle:(id)style;

- (void) addChildStyle:(DZStyle*)style;
- (void) removeChildStyle:(DZStyle*)style;
- (void) removeAllChildStyle;;
@end
