//
//  DZViewController.m
//  StyleSheet
//
//  Created by dongzhao on 07/23/2015.
//  Copyright (c) 2015 dongzhao. All rights reserved.
//

#import "DZViewController.h"
#import <DZStyleCSS.h>

@interface DZViewController ()

@end

EXTERN_SHARE_LABEL_STYLE(Content)

IMP_SHARE_LABEL_STYLE(Content,
                      style.backgroundColor = [UIColor clearColor];
                      style.cornerRedius = 2;
                      style.textStyle.textColor = [UIColor redColor];
                      )

IMP_SHARE_SWITCH_STYLE(RedContent,
                       style.backgroundColor = [UIColor redColor];
                       )



@implementation DZViewController

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    
//    self.label.style.backgroundColor = [UIColor redColor];
//
    
#ifdef ORIGIN_TEST
    self.label.layer.cornerRadius = 3;
    self.label.textColor = [UIColor darkTextColor];
    self.label.font = [UIFont systemFontOfSize:13];
    self.label.backgroundColor = [UIColor greenColor];
    self.label.layer.borderWidth = 2;
    self.label.layer.borderColor = [UIColor redColor].CGColor;
    
    
    self.label2.layer.cornerRadius = 3;
    self.label2.textColor = [UIColor darkTextColor];
    self.label2.font = [UIFont systemFontOfSize:13];
    self.label2.backgroundColor = [UIColor greenColor];
    self.label2.layer.borderWidth = 2;
    self.label2.layer.borderColor = [UIColor redColor].CGColor;
    
    
    self.button.layer.cornerRadius = 3;
    self.button.backgroundColor = [UIColor greenColor];
    self.button.layer.borderWidth = 2;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    self.aView.layer.cornerRadius = 3;
    self.aView.backgroundColor = [UIColor greenColor];
    self.aView.layer.borderWidth = 2;
    self.aView.layer.borderColor = [UIColor redColor].CGColor;
    
    
#else
    
    DZTextStyle* textStyle =  DZTextStyleMake(
                    style.font = [UIFont systemFontOfSize:20];
                    style.textColor = [UIColor darkTextColor];
    );
    
    
    self.label.style = DZStyleRedContent();
    self.label2.style = self.label.style;
    self.label2.style.textStyle = textStyle;
    self.label2.adjustsFontSizeToFitWidth = YES;
    self.aView.style = self.label.style;
    self.aView.style.backgroundColor = [UIColor blueColor];
    [self.button.style copyAttributesWithStyle:self.label.style];
#endif
//
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
