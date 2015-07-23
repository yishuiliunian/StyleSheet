//
//  DZViewStyle.h
//  DZStyle
//
//  Created by baidu on 15/7/22.
//  Copyright (c) 2015年 dzpqzb. All rights reserved.
//

#import "DZStyle.h"

#define DZStyleMake(initCode , cla) \
^{ \
cla * style = [[cla alloc] init]; \
{initCode} \
return style; \
}(); \


#define DZViewStyleMake(initCode) DZStyleMake(initCode, DZViewStyle)

#define IMP_SHARE_VIEW_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZViewStyle)
#define EXTERN_SHARE_VIEW_STYLE(name)           EXTERN_SHARE_STYLE(name, DZViewStyle);

@interface DZViewStyle : DZStyle
{
     CGFloat _cornerRedius;
     CGFloat _borderWidth;
     UIColor* _borderColor;
     UIColor* _backgroundColor;
     CGFloat _alpha;
     BOOL _clipsToBounds;
     BOOL _clearsContextBeforeDrawing;
}
@property (nonatomic, assign) CGFloat cornerRedius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor* borderColor;
@property (nonatomic, strong) UIColor* backgroundColor;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) BOOL clipsToBounds;
@property (nonatomic, assign) BOOL clearsContextBeforeDrawing;
@end
