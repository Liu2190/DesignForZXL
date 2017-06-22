//
//  ThreeViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeInforViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

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
    [self.backButton setImage:[UIImage imageNamed:@"page3home"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page3homehigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.mapView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panpan:)];
    [self.mapView addGestureRecognizer:panGesture];
    self.mapView.backgroundColor = [UIColor redColor];
    UIButton *location1 = [UIButton buttonWithType:UIButtonTypeCustom];
    location1.frame = CGRectMake(42, 354/2, 50, 50);
    [location1 setImage:[UIImage imageNamed:@"shuzhan"] forState:UIControlStateNormal];
    [location1 setImage:[UIImage imageNamed:@"shuzhanhigh"] forState:UIControlStateHighlighted];
    [location1 addTarget:self action:@selector(location1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:location1];
    
    UIButton *location2 = [UIButton buttonWithType:UIButtonTypeCustom];
    location2.frame = CGRectMake(424/2, 204/2, 45, 45);
    [location2 setImage:[UIImage imageNamed:@"shuzhan"] forState:UIControlStateNormal];
    [location2 setImage:[UIImage imageNamed:@"shuzhanhigh"] forState:UIControlStateHighlighted];
    [location2 addTarget:self action:@selector(location2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:location2];
    
    UIButton *location3 = [UIButton buttonWithType:UIButtonTypeCustom];
    location3.frame = CGRectMake(350/2, 636/2, 32, 32);
    [location3 setImage:[UIImage imageNamed:@"shuzhan"] forState:UIControlStateNormal];
    [location3 setImage:[UIImage imageNamed:@"shuzhanhigh"] forState:UIControlStateHighlighted];
    [location3 addTarget:self action:@selector(location3Action) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:location3];
}
-(void)location3Action
{
    ThreeInforViewController *infor = [[ThreeInforViewController alloc]initWithNibName:@"ThreeInforViewController" bundle:nil];
    infor.num = 2;
    [self.navigationController pushViewController:infor animated:YES];
}
-(void)location2Action
{
    ThreeInforViewController *infor = [[ThreeInforViewController alloc]initWithNibName:@"ThreeInforViewController" bundle:nil];
    infor.num = 1;
    
    [self.navigationController pushViewController:infor animated:YES];
}
-(void)location1Action
{
    ThreeInforViewController *infor = [[ThreeInforViewController alloc]initWithNibName:@"ThreeInforViewController" bundle:nil];
    infor.num= 0;
    [self.navigationController pushViewController:infor animated:YES];
}
//对图片进行拖动
- (void)panpan:(UIPanGestureRecognizer *)sender
{
    CGPoint translatedPoint = [sender translationInView:self.view];
    CGFloat x = sender.view.center.x + translatedPoint.x;
    CGFloat y = sender.view.center.y + translatedPoint.y;
    sender.view.center = CGPointMake(x, y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
}
-(void)backAction
{
    self.mapView.frame = CGRectMake(0, 0, 320, 568);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
