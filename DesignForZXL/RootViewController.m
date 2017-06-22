//
//  RootViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-13.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 640)];
    label.text = @"abcdefg";
    UIFont *font = [UIFont fontWithName:@"Dekar" size:20];
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor darkGrayColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
