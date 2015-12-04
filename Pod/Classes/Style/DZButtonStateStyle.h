//
//  DZButtonStateStyle.h
//  Pods
//
//  Created by baidu on 15/8/6.
//
//

#import "DZStyle.h"

#define DZButtonStateStyleMake(initCode)               DZStyleMake(initCode, DZButtonStateStyle)
#define IMP_SHARE_BUTTON_STATE_STYLE(name , initCode)   IMP_SHARE_STYLE(name , initCode, DZButtonStateStyle)
#define EXTERN_SHARE_BUTTON_STATE_STYLE(name)           EXTERN_SHARE_STYLE(name, DZButtonStateStyle);

@interface DZButtonStateStyle : DZStyle
@property (nonatomic, assign) UIControlState state;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* titleShadowColor;
@property (nonatomic, strong) UIImage* backgroundImage;
@end
