//
//  ThreeInforViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ThreeInforViewController.h"
#import "ThreeInforHeaderView.h"
#import "BookViewController.h"
#import "ThreeCell.h"
@interface ThreeInforViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UIScrollView *scrol;
@property (nonatomic,retain)UITableView *table1;
@property (nonatomic,retain)UITableView *table2;
@property (nonatomic,retain)UITableView *table3;
@property (nonatomic,retain)NSArray *array1;
@property (nonatomic,retain)NSArray *array2;

@end

@implementation ThreeInforViewController
@synthesize num;
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
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"Table4List" ofType:@"plist"];
    self.array1 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSString *path2  = [[NSBundle mainBundle] pathForResource:@"Table2List" ofType:@"plist"];
    self.array2 = [[NSMutableArray alloc] initWithContentsOfFile:path2];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"page3back"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page3backhigh"] forState:UIControlStateHighlighted];
    [self.leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    self.scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 154/2, 320, 568-154/2)];
    self.scrol.userInteractionEnabled = YES;
    self.scrol.contentSize = CGSizeMake(320*3, 568-154/2);
    self.scrol.pagingEnabled = YES;
    self.scrol.bounces = NO;
    [self.view addSubview:self.scrol];
    
    self.table1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568-154/2) style:UITableViewStylePlain];
    self.table1.dataSource = self;
    self.table1.delegate = self;
    self.table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrol addSubview:self.table1];
    ThreeInforHeaderView *header1 = [[[NSBundle mainBundle]loadNibNamed:@"ThreeInforHeaderView" owner:self options:nil] lastObject];
    [header1 setNameAndDistance:@"Location:Wanghua road No.24" And:@"Distance:12KM"];
    self.table1.tableHeaderView = header1;
    
    self.table2 = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, 568-154/2) style:UITableViewStylePlain];
    self.table2.dataSource = self;
    self.table2.delegate = self;
    self.table2.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrol addSubview:self.table2];
    ThreeInforHeaderView *header2 = [[[NSBundle mainBundle]loadNibNamed:@"ThreeInforHeaderView" owner:self options:nil] lastObject];
    [header2 setNameAndDistance:@"Location:Futong East street No.31" And:@"Distance:39KM"];
    self.table2.tableHeaderView = header2;
    
    self.table3 = [[UITableView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 568-154/2) style:UITableViewStylePlain];
    self.table3.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table3.dataSource = self;
    self.table3.delegate = self;
    [self.scrol addSubview:self.table3];
    ThreeInforHeaderView *header3 = [[[NSBundle mainBundle]loadNibNamed:@"ThreeInforHeaderView" owner:self options:nil] lastObject];
    [header3 setNameAndDistance:@"Location:Huajiadi South street No.10" And:@"Distance:2KM"];
    self.table3.tableHeaderView = header3;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    v.backgroundColor = [UIColor whiteColor];
    UIImageView *foot = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"无书框"]];
    foot.frame = CGRectMake(32, 8,257 , 42);
    [v addSubview:foot];
    self.table3.tableFooterView = v;
    [self.view bringSubviewToFront:self.leftButton];
    [self.view bringSubviewToFront:self.rightButton];
    [self.scrol setContentOffset:CGPointMake(num*320, 0)];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.table1)
    {
        return self.array1.count;
    }
    if(tableView == self.table2)
    {
        return self.array2.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    if(tableView == self.table1)
    {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeCell" owner:self options:nil]lastObject];
        }
        NSDictionary *dict = [self.array1 objectAtIndex:indexPath.row];
        [cell setCellValueWith:[dict objectForKey:@"name"] And:[dict objectForKey:@"image"]];
        return cell;
    }
    if(tableView == self.table2)
    {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeCell" owner:self options:nil]lastObject];
        }
        NSDictionary *dict = [self.array2 objectAtIndex:indexPath.row];
        [cell setCellValueWith:[dict objectForKey:@"name"] And:[dict objectForKey:@"image"]];
        return cell;
    }
    if(tableView == self.table3)
    {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeCell" owner:self options:nil]lastObject];
        }
        return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.table1)
    {
        NSDictionary *dict = [self.array1 objectAtIndex:indexPath.row];
        if([[dict objectForKey:@"index"] intValue]<9)
        {
            BookViewController *catVC = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
            catVC.num = [[dict objectForKey:@"index"] intValue]-1;
            [self.navigationController pushViewController:catVC animated:YES];
        }
    }
    if(tableView == self.table2)
    {
        NSDictionary *dict = [self.array2 objectAtIndex:indexPath.row];
        if([[dict objectForKey:@"index"] intValue]<9)
        {
            BookViewController *catVC = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
            catVC.num = [[dict objectForKey:@"index"] intValue]-1;
            [self.navigationController pushViewController:catVC animated:YES];
        }
    }
}
-(void)leftAction
{
    
}
-(void)rightAction
{
    
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
