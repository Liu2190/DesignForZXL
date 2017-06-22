//
//  BookViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-5-10.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *scrol;
@end

@implementation BookViewController

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
    self.scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrol.backgroundColor = [UIColor redColor];
    self.scrol.pagingEnabled = YES;
    self.scrol.delegate = self;
    self.scrol.bounces = NO;
    self.scrol.contentSize = CGSizeMake(320*8, 568);
    [self.view addSubview:self.scrol];
    [self setScrolValue];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(19, 33, 26, 26);
    [button setImage:[UIImage imageNamed:@"page3back"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"page3backhigh"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIImageView *searchBar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar.png"]];
    searchBar.frame = CGRectMake(63, 34, 200, 28);
    [self.view addSubview:searchBar];
}
-(void)setScrolValue
{
    NSArray *array = [NSArray arrayWithObjects:@"shu1",@"shu2",@"shu3",@"shu4",@"shu5",@"shu6",@"shu7",@"shu8", nil];
    for(int i = 0;i<[array count];i++)
    {
        UIImageView *book = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[array objectAtIndex:i]]];
        book.frame = CGRectMake(320*i,0, 320, 568);
        [self.scrol addSubview:book];
    }
    self.scrol.contentOffset = CGPointMake(320*self.num, 0);
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
