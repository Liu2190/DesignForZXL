//
//  FourViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "FourViewController.h"
#import "FourInforViewController.h"
@interface FourViewController ()

@end

@implementation FourViewController

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
    self.navigationController.navigationBar.hidden = YES;
    [self.backButton setImage:[UIImage imageNamed:@"page4Tohome"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page4Tohomehigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.inforButton setImage:[UIImage imageNamed:@"page4button"] forState:UIControlStateNormal];
    [self.inforButton setImage:[UIImage imageNamed:@"page4buttonhigh"] forState:UIControlStateHighlighted];
    [self.inforButton addTarget:self action:@selector(inforAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated: YES];
}
-(void)inforAction
{
    //进入详情页面
    FourInforViewController *inforVC = [[FourInforViewController alloc]initWithNibName:@"FourInforViewController" bundle:nil];
    [self.navigationController pushViewController:inforVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
