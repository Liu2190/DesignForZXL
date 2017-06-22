//
//  FourInforViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "FourInforViewController.h"

@interface FourInforViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *scrol;
@end

@implementation FourInforViewController

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
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"page4BackButton"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page4BackButtonhigh"] forState:UIControlStateHighlighted];
    self.scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, (736+177)/2, 320, 60)];
    self.scrol.delegate = self;
    self.scrol.userInteractionEnabled = YES;
    self.scrol.contentSize = CGSizeMake(60*10, 60);
    NSArray *imageArray = [NSArray arrayWithObjects:@"touxiang1",@"touxiang2",@"touxiang3",@"touxiang4",@"touxiang5",@"touxiang6",@"touxiang7",@"touxiang8",@"touxiang9",@"touxiang10", nil];
    for(int i = 0;i<[imageArray count];i++)
    {
        UIImageView *iView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
        iView.frame = CGRectMake(i*60, 0, 60, 60);
        [self.scrol addSubview:iView];
    }
    self.scrol.showsHorizontalScrollIndicator = NO;
    self.scrol.scrollEnabled = YES;
    [self.view addSubview:self.scrol];
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
