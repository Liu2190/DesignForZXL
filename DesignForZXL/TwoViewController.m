//
//  TwoViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TwoViewController.h"
#import "CategoryView.h"
#import "ZhongleiView.h"
#import "ZhongleiViewController.h"
#import "BookViewController.h"
@interface TwoViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *xinpinScrol;
@property (nonatomic,retain)UIView *zhonglei;
@end

@implementation TwoViewController

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
    [self.houtuiButton setImage:[UIImage imageNamed:@"page3home"] forState:UIControlStateNormal];
    [self.houtuiButton setImage:[UIImage imageNamed:@"page3homehigh"] forState:UIControlStateHighlighted];
    [self.xinpinButton setImage:[UIImage imageNamed:@"新书1"] forState:UIControlStateNormal];
    [self.xinpinButton setImage:[UIImage imageNamed:@"新书2"] forState:UIControlStateSelected];
    [self.zhongleiButton setImage:[UIImage imageNamed:@"目录1"] forState:UIControlStateNormal];
    [self.zhongleiButton setImage:[UIImage imageNamed:@"目录2"] forState:UIControlStateSelected];
    self.navigationController.navigationBar.hidden = YES;
    self.xinpinButton.selected = YES;
    self.zhonglei = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 400)];
    self.zhonglei.hidden = YES;
    self.zhonglei.userInteractionEnabled = YES;
    [self.backVie addSubview:self.zhonglei];
    [self setZhongleiBackView];
    self.xinpinScrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 37, 320, 450-27)];
    self.xinpinScrol.backgroundColor = [UIColor clearColor];
    self.xinpinScrol.delegate = self;
    self.xinpinScrol.contentSize = CGSizeMake(320, 690);
    self.xinpinScrol.scrollEnabled = YES;
    self.xinpinScrol.userInteractionEnabled = YES;
    [self.backVie addSubview:self.xinpinScrol];
    self.backVie.userInteractionEnabled = YES;
    [self setScrolView];
}
-(void)setZhongleiBackView
{
    NSArray *buttonArray = [NSArray arrayWithObjects:@"111normal",@"222normal",@"333normal",@"444normal",@"555normal",@"666normal",@"777normal",@"888normal",@"999normal", nil];
     NSArray *titleArray = [NSArray arrayWithObjects:@"literature and art",@"Science",@"Life",@"Cyclepedia",@"Newspaper",@"Management",@"Pictures",@"Foods",@"Others", nil];
    NSArray *highlight = [NSArray arrayWithObjects:@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888",@"999", nil];
    for(int i = 0;i<buttonArray.count;i++)
    {
        ZhongleiView *cateButton = [[[NSBundle mainBundle]loadNibNamed:@"ZhongleiView" owner:self options:nil]lastObject];
        [cateButton.zhongleiButton setImage:[UIImage imageNamed:[buttonArray objectAtIndex:i]] forState:UIControlStateNormal];
        [cateButton.zhongleiButton setImage:[UIImage imageNamed:[highlight objectAtIndex:i]] forState:UIControlStateHighlighted];
        cateButton.frame = CGRectMake(33 +(i%3)*95, (i/3)*110, 95, 110);
        cateButton.userInteractionEnabled = YES;
        cateButton.zhongleiButton.tag = 100+i;
        cateButton.zhongleiLabel.text = [titleArray objectAtIndex:i];
        cateButton.zhongleiLabel.font =[UIFont fontWithName:@"Dekar" size:10];
        [cateButton.zhongleiButton addTarget:self action:@selector(ToCell:) forControlEvents:UIControlEventTouchUpInside];
        [self.zhonglei addSubview:cateButton];
    }
    ZhongleiView *collect = [[[NSBundle mainBundle]loadNibNamed:@"ZhongleiView" owner:self options:nil]lastObject];
    collect.backgroundColor = [UIColor clearColor];
    collect.frame = CGRectMake(31 +(10%3)*99, (10/3)*104-20, 93, 104);
    UIImageView *img =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"category10"]];
    img.frame = CGRectMake(15, 42, 40, 40);
    
    [collect addSubview:img];
    collect.zhongleiLabel.text = @"collect";
    collect.zhongleiLabel.font =[UIFont fontWithName:@"Dekar" size:10];
    [self.zhonglei addSubview:collect];
    CGRect frame = collect.zhongleiLabel.frame;
    frame.origin.y = 40;
    collect.zhongleiLabel.frame = frame;
}
-(void)ToCell:(UIButton *)sender
{
    if((sender.tag-100)<5)
    {
        ZhongleiViewController *zh = [[ZhongleiViewController alloc]initWithNibName:@"ZhongleiViewController" bundle:nil];
        zh.num = (int)sender.tag -100;
        [self.navigationController pushViewController:zh animated:YES];
    }
}
- (void)setScrolView
{
    NSArray *imgArray = [NSArray arrayWithObjects:@"xinpin1",@"xinpin2",@"xinpin3",@"xinpin4",@"xinpin5",@"xinpin6",@"xinpin7",@"xinpin8",@"xinpin9",@"xinpin10",@"xinpin11",@"xinpin12",@"xinpin13",@"xinpin14",@"xinpin15",@"xinpin16",@"xinpin17", nil];
    for(int i = 0;i<imgArray.count;i++)
    {
        CategoryView *xinpinView = [[[NSBundle mainBundle]loadNibNamed:@"CategoryView" owner:self options:nil]lastObject];
        xinpinView.userInteractionEnabled = YES;
        xinpinView.frame = CGRectMake(66/2+88*(i%3), 111*(i/3), 88, 111);
        [xinpinView setbookImageValue:[imgArray objectAtIndex:i]];
        xinpinView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bookDidClick:)];
        [xinpinView addGestureRecognizer:tap];
        [self.xinpinScrol addSubview:xinpinView];
    }
}
-(void)bookDidClick:(UITapGestureRecognizer *)sender
{   if(sender.view.tag<8)
    {
        BookViewController *cate = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
        cate.num = (int)sender.view.tag;
        [self.navigationController pushViewController:cate animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)xinpinAction:(id)sender {
    self.xinpinButton.selected = YES;
    self.zhongleiButton.selected = NO;
    self.xinpinScrol.hidden = NO;
    self.zhonglei.hidden = YES;
    self.lineImage.hidden = NO;
}

- (IBAction)zhongleiAction:(id)sender {
    self.xinpinButton.selected = NO;
    self.zhongleiButton.selected = YES;
    self.xinpinScrol.hidden = YES;
    self.zhonglei.hidden = NO;
    self.lineImage.hidden = YES;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
