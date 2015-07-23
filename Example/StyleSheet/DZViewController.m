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

@implementation DZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label.style = DZLabelStyleMake(
                                        style.backgroundColor = [UIColor greenColor];
                                        style.cornerRedius = 13;
                                        style.borderColor = [UIColor redColor];
                                        style.borderWidth = 2;
    );
    
    self.button.style = self.label.style;
    self.aView.style = self.label.style;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
