//
//  DZStyleRender.h
//  Pods
//
//  Created by baidu on 15/7/31.
//
//

#import <Foundation/Foundation.h>


#define DZShareStypeRender [DZStyleRender shareRender]
@class DZStyle;
@interface DZStyleRender : NSObject
+ (DZStyleRender*) shareRender;
- (void) addNeedRenderStyle:(DZStyle*)style;
@end
