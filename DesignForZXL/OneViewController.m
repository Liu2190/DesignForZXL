//
//  OneViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "OneViewController.h"
#import "HomeInfor1View.h"
#import "HomeInfor4View.h"
#import "Home2Cell.h"
#import "Home3Cell.h"
@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    CGFloat contentOffsetY;
    
    CGFloat oldContentOffsetY;
    
    CGFloat newContentOffsetY;
}
@property (nonatomic,retain)HomeInfor1View *infor1View;
@property (nonatomic,retain)HomeInfor4View *infor4View;
@property (nonatomic,retain)UITableView *table1;
@property (nonatomic,retain)UITableView *table2;
@property (nonatomic,retain)NSArray *infor1Array;
@property (nonatomic,retain)NSArray *infor2Array;
@end

@implementation OneViewController

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
    self.tipView.hidden = NO;
    self.tip2.hidden = YES;
    self.tip3.hidden = YES;
    self.tip4.hidden = YES;
    self.infor1Array = [[NSArray alloc]initWithObjects:@"home2infor1",@"home2infor2",@"home2infor3",@"home2infor4",@"home2infor5",@"home2infor6",@"home2infor7",@"home2infor8", nil];
    self.infor2Array = [[NSArray alloc]initWithObjects:@"home3infor1",@"home3infor2",@"home3infor3",@"home3infor4", nil];
    self.navigationController.navigationBar.hidden = YES;
    [self.backButton setImage:[UIImage imageNamed:@"page3home"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page3homehigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button1 setImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
    [self.button1 setImage:[UIImage imageNamed:@"home1high"] forState:UIControlStateSelected];
    [self.button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    self.button1.selected = YES;
    
    
    [self.button2 setImage:[UIImage imageNamed:@"home2"] forState:UIControlStateNormal];
    [self.button2 setImage:[UIImage imageNamed:@"home2high"] forState:UIControlStateSelected];
    [self.button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button3 setImage:[UIImage imageNamed:@"home3"] forState:UIControlStateNormal];
    [self.button3 setImage:[UIImage imageNamed:@"home3high"] forState:UIControlStateSelected];
    [self.button3 addTarget:self action:@selector(button3Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button4 setImage:[UIImage imageNamed:@"home4"] forState:UIControlStateNormal];
    [self.button4 setImage:[UIImage imageNamed:@"home4high"] forState:UIControlStateSelected];
    [self.button4 addTarget:self action:@selector(button4Action) forControlEvents:UIControlEventTouchUpInside];
    self.infor1View = [[[NSBundle mainBundle]loadNibNamed:@"HomeInfor1View" owner:self options:nil]lastObject];
    self.infor1View.frame = CGRectMake(0, 269, 320, 300) ;
    [self.view addSubview:self.infor1View];
    self.infor4View = [[[NSBundle mainBundle]loadNibNamed:@"HomeInfor4View" owner:self options:nil]lastObject];
    self.infor4View.frame = CGRectMake(0, 269, 320, 300) ;
    [self.view addSubview:self.infor4View];
    
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeback"]];
    backImage.frame = CGRectMake(0, 0, 0, 300);
    self.table2 = [[UITableView alloc]initWithFrame:CGRectMake(0, 269, 320, 300) style:UITableViewStylePlain];
    self.table2.delegate = self;
    self.table2.dataSource = self;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 47)];
    v.backgroundColor = [UIColor clearColor];
    self.table2.tableHeaderView = v;
    self.table2.backgroundColor = [UIColor clearColor];
    self.table2.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.table2];
    
    self.table1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 269, 320, 300) style:UITableViewStylePlain];
    self.table1.delegate = self;
    self.table1.dataSource = self;
    self.table1.backgroundColor = [UIColor clearColor];
    self.table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 47)];
    v1.backgroundColor = [UIColor clearColor];
    self.table1.tableHeaderView = v1;
    [self.view addSubview:self.table1];
    
    [self.view bringSubviewToFront:self.infor1View];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.table1)
    {
        return 57;
    }
    return 112;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.table1)
    {
        return 8;
    }
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    if(tableView == self.table1)
    {
        Home2Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"Home2Cell" owner:self options:nil]lastObject];
        }
        cell.bookInfor.image = [UIImage imageNamed:[self.infor1Array objectAtIndex:indexPath.row]];
        return cell;
    }
    Home3Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"Home3Cell" owner:self options:nil]lastObject];
    }
    cell.bookInfor.image = [UIImage imageNamed:[self.infor2Array objectAtIndex:indexPath.row]];
    return cell;
}
-(void)button1Action
{
    self.infor1View.hidden = NO;
    self.infor4View.hidden = YES;
    self.table1.hidden = YES;
    self.table2.hidden = YES;
    self.button1.selected = YES;
    self.button2.selected = NO;
    self.button3.selected = NO;
    self.button4.selected = NO;
    self.tipView.hidden = NO;
    self.tip2.hidden = YES;
    self.tip3.hidden = YES;
    self.tip4.hidden = YES;
}
-(void)button2Action
{
    self.infor1View.hidden = YES;
    self.infor4View.hidden = YES;
    self.table1.hidden = NO;
    self.table2.hidden = YES;
    self.button1.selected = NO;
    self.button2.selected = YES;
    self.button3.selected = NO;
    self.button4.selected = NO;
    self.tipView.hidden = YES;
    self.tip2.hidden = NO;
    self.tip3.hidden = YES;
    self.tip4.hidden = YES;
}
-(void)button3Action
{
    self.infor1View.hidden = YES;
    self.infor4View.hidden = YES;
    self.table1.hidden = YES;
    self.table2.hidden = NO;
    self.button1.selected = NO;
    self.button2.selected = NO;
    self.button3.selected = YES;
    self.button4.selected = NO;
    self.tipView.hidden = YES;
    self.tip2.hidden = YES;
    self.tip3.hidden = NO;
    self.tip4.hidden = YES;
}
-(void)button4Action
{
        self.infor1View.hidden = YES;
        self.table1.hidden = YES;
        self.table2.hidden = YES;
        self.button4.selected = YES;
        self.tipView.hidden = YES;
        self.tip2.hidden = YES;
        self.tip3.hidden = YES;
        self.infor4View.hidden = NO;
        
        self.button1.selected = NO;
        self.button2.selected = NO;
        self.button3.selected = NO;
        self.tip4.hidden = NO;
    
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
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    oldContentOffsetY = scrollView.contentOffset.y;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    contentOffsetY = scrollView.contentOffset.y;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    newContentOffsetY = scrollView.contentOffset.y;
    
        if (scrollView.dragging) {
    
            if ((scrollView.contentOffset.y - contentOffsetY) > 5.0f){  // 向上滚动
                if(scrollView == self.table1)
                {
                    [UIView beginAnimations:nil context:nil];
                    self.yellowView.frame = CGRectMake(0, 0, 320, 568);
                    self.table1.frame = CGRectMake(0, 0, 320, 568);
                    [UIView setAnimationDuration:5];
                    [UIView commitAnimations];

                    
                }
                if(scrollView == self.table2)
                {
                    [UIView beginAnimations:nil context:nil];
                    self.yellowView.frame = CGRectMake(0, 0, 320, 568);
                    self.table2.frame = CGRectMake(0, 0, 320, 568);
                    [UIView setAnimationDuration:5];
                    [UIView commitAnimations];
                }
                
    
            } else if ((contentOffsetY - scrollView.contentOffset.y) > 5.0f) { // 向下滚动
    
            self.yellowView.frame = CGRectMake(0, 269, 320, 300);
                if(scrollView == self.table1)
                {
                    [UIView beginAnimations:nil context:nil];
                    self.table1.frame = CGRectMake(0,269 , 320, 538);
                    [UIView setAnimationDuration:5];
                    [UIView commitAnimations];
                }
                if(scrollView == self.table2)
                {
                    [UIView beginAnimations:nil context:nil];
                    self.table2.frame = CGRectMake(0, 269, 320, 538);
                    [UIView setAnimationDuration:5];
                    [UIView commitAnimations];
                }
            }
        }
}

@end
