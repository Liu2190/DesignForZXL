//
//  ZhongleiViewController.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-24.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ZhongleiViewController.h"
#import "CategoryCell.h"
#import "CategoryHeaderView.h"
#import "BookViewController.h"
@interface ZhongleiViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UIScrollView *scro;
@property (nonatomic,retain)UITableView *table1;
@property (nonatomic,retain)NSMutableArray *array1;
@property (nonatomic,retain)NSMutableArray *array2;
@property (nonatomic,retain)NSMutableArray *array3;
@property (nonatomic,retain)NSMutableArray *array4;
@property (nonatomic,retain)NSMutableArray *array5;
@property (nonatomic,retain)UITableView *table2;
@property (nonatomic,retain)UITableView *table3;
@property (nonatomic,retain)UITableView *table4;
@property (nonatomic,retain)UITableView *table5;
@end

@implementation ZhongleiViewController
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
    [self.backButton setImage:[UIImage imageNamed:@"page3back"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"page3backhigh"] forState:UIControlStateHighlighted];
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"Table1List" ofType:@"plist"];
    self.array1 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSString *path2  = [[NSBundle mainBundle] pathForResource:@"Table2List" ofType:@"plist"];
    self.array2 = [[NSMutableArray alloc] initWithContentsOfFile:path2];
    NSString *path3  = [[NSBundle mainBundle] pathForResource:@"Table3List" ofType:@"plist"];
    self.array3 = [[NSMutableArray alloc] initWithContentsOfFile:path3];
    NSString *path4  = [[NSBundle mainBundle] pathForResource:@"Table4List" ofType:@"plist"];
    self.array4 = [[NSMutableArray alloc] initWithContentsOfFile:path4];
    NSString *path5  = [[NSBundle mainBundle] pathForResource:@"Table5List" ofType:@"plist"];
    self.array5 = [[NSMutableArray alloc] initWithContentsOfFile:path5];
    // Do any additional setup after loading the view from its nib.
    self.scro = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 72, 320, 568-72)];
    self.scro.contentSize = CGSizeMake(320*5, 568-72);
    self.scro.scrollEnabled = YES;
    self.scro.delegate = self;
    self.scro.backgroundColor = [UIColor whiteColor];
    self.scro.pagingEnabled = YES;
    self.scro.bounces = NO;
    self.scro.alwaysBounceHorizontal = NO;
    self.scro.userInteractionEnabled = YES;
    [self.view addSubview:self.scro];
    
    [self setScroValue];
}
- (void)setScroValue
{
    self.table1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568-72) style:UITableViewStylePlain];
    self.table1.delegate = self;
    self.table1.dataSource = self;
    self.table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    CategoryHeaderView *header1 = [[[NSBundle mainBundle]loadNibNamed:@"CategoryHeaderView" owner:self options:nil]lastObject];
    header1.categoryView.image = [UIImage imageNamed:@"category11"];
    self.table1.tableHeaderView = header1;
    [self.scro addSubview:self.table1];
    
    self.table2 = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, 568-72) style:UITableViewStylePlain];
    self.table2.delegate = self;
    self.table2.dataSource = self;
    self.table2.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scro addSubview:self.table2];
    CategoryHeaderView *header2 = [[[NSBundle mainBundle]loadNibNamed:@"CategoryHeaderView" owner:self options:nil]lastObject];
    header2.categoryView.image = [UIImage imageNamed:@"category22"];
    self.table2.tableHeaderView = header2;
    
    self.table3 = [[UITableView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 568-72) style:UITableViewStylePlain];
    self.table3.delegate = self;
    self.table3.dataSource = self;
    self.table3.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scro addSubview:self.table3];
    CategoryHeaderView *header3 = [[[NSBundle mainBundle]loadNibNamed:@"CategoryHeaderView" owner:self options:nil]lastObject];
    header3.categoryView.image = [UIImage imageNamed:@"category33"];
    self.table3.tableHeaderView = header3;
    
    self.table4 = [[UITableView alloc]initWithFrame:CGRectMake(320*3, 0, 320, 568-72) style:UITableViewStylePlain];
    self.table4.delegate = self;
    self.table4.dataSource = self;
    self.table4.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scro addSubview:self.table4];
    CategoryHeaderView *header4 = [[[NSBundle mainBundle]loadNibNamed:@"CategoryHeaderView" owner:self options:nil]lastObject];
    header4.categoryView.image = [UIImage imageNamed:@"category44"];
    self.table4.tableHeaderView = header4;
    
    self.table5 = [[UITableView alloc]initWithFrame:CGRectMake(320*4, 0, 320, 568-72) style:UITableViewStylePlain];
    self.table5.delegate = self;
    self.table5.dataSource = self;
    self.table5.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scro addSubview:self.table5];
    CategoryHeaderView *header5 = [[[NSBundle mainBundle]loadNibNamed:@"CategoryHeaderView" owner:self options:nil]lastObject];
    header5.categoryView.image = [UIImage imageNamed:@"category55"];
    self.table5.tableHeaderView = header5;
    [self.scro setContentOffset:CGPointMake(num*320, 0)];
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
    if(tableView == self.table3)
    {
        return self.array3.count;
    }
    if(tableView == self.table4)
    {
        return self.array4.count;
    }
    if(tableView == self.table5)
    {
        return self.array5.count;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 91.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    CategoryCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryCell" owner:self options:nil] lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(cell == nil)
    {
        [tableView dequeueReusableCellWithIdentifier:identifier];
    }
    if(tableView == self.table1)
    {
        NSDictionary *dict = [self.array1 objectAtIndex:indexPath.row];
        cell.bookImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        cell.bookTitle.text = [dict objectForKey:@"name"];
    }
    if(tableView == self.table2)
    {
        NSDictionary *dict = [self.array2 objectAtIndex:indexPath.row];
        cell.bookImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        cell.bookTitle.text = [dict objectForKey:@"name"];
    }
    if(tableView == self.table3)
    {
        NSDictionary *dict = [self.array3 objectAtIndex:indexPath.row];
        cell.bookImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        cell.bookTitle.text = [dict objectForKey:@"name"];
    }
    if(tableView == self.table4)
    {
        NSDictionary *dict = [self.array4 objectAtIndex:indexPath.row];
        cell.bookImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        cell.bookTitle.text = [dict objectForKey:@"name"];
    }
    if(tableView == self.table5)
    {
        NSDictionary *dict = [self.array5 objectAtIndex:indexPath.row];
        cell.bookImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
        cell.bookTitle.text = [dict objectForKey:@"name"];
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
    if(tableView == self.table3)
    {
        NSDictionary *dict = [self.array3 objectAtIndex:indexPath.row];
        if([[dict objectForKey:@"index"] intValue]<9)
        {
            BookViewController *catVC = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
            catVC.num = [[dict objectForKey:@"index"] intValue]-1;
            [self.navigationController pushViewController:catVC animated:YES];
        }    }
    if(tableView == self.table4)
    {
        NSDictionary *dict = [self.array4 objectAtIndex:indexPath.row];
        if([[dict objectForKey:@"index"] intValue]<9)
        {
            BookViewController *catVC = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
            catVC.num = [[dict objectForKey:@"index"] intValue]-1;
            [self.navigationController pushViewController:catVC animated:YES];
        }
    }
    if(tableView == self.table5)
    {
        NSDictionary *dict = [self.array5 objectAtIndex:indexPath.row];
        if([[dict objectForKey:@"index"] intValue]<9)
        {
            BookViewController *catVC = [[BookViewController alloc]initWithNibName:@"BookViewController" bundle:nil];
            catVC.num = [[dict objectForKey:@"index"] intValue]-1;
            [self.navigationController pushViewController:catVC animated:YES];
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
