//  群号:474837667
//  ViewController.m
//  selectDemo
//
//  Created by mc on 2017/11/25.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"
#import "SelectTableViewCell.h"

@interface ViewController ()<SelectScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    NSMutableArray *muAry=[[NSMutableArray alloc]init];
    [muAry addObject:@"Java"];
    
    self.myScroll=[[SelectScrollView alloc]initWithFrame:Frame(0, NavHeight, WIDTH, HEIGHT-NavHeight+34) andArray:hotSeaches andDisAry:muAry];
    self.myScroll.distoryTableView.delegate=self;
    self.myScroll.distoryTableView.dataSource=self;
//    [self.myScroll.distoryArray addObject:@"Java"];
    self.myScroll.labelDelegate=self;
    [self.view addSubview:self.myScroll];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)labelText:(NSString *)str
{
    [self.myScroll addWithString:str];
//    [self.myScroll ]
    detailViewController *detailVc=[[detailViewController alloc]init];
    detailVc.title=str;
    [self.navigationController pushViewController:detailVc animated:YES];
    
}

#pragma mark - DataSource,Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.myScroll.distoryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        SelectTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SelectTableViewCell" forIndexPath:indexPath];
    
    cell.selCelLbel.text =self.myScroll.distoryArray[indexPath.row];
    cell.del.tag=100+indexPath.row;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(delcell:)];
    [cell.del addGestureRecognizer:tap];
    cell.del.userInteractionEnabled=YES;
//        cell.dataDic =adataArray[indexPath.row];
//        [cell.kaoshiBut addTarget:self action:@selector(kaishiButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    
    
    //    [heightArray replaceObjectAtIndex:indexPath.row withObject:[cell getHeight]]
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    CGFloat height =[heightArray[indexPath.row] floatValue];
    return 40;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self labelText:self.myScroll.distoryArray[indexPath.row]];
    //    InsDetailViewController *vc =[InsDetailViewController new];
    //    self.hidesBottomBarWhenPushed =YES;
    //    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)delcell:(UITapGestureRecognizer *)sender
{
    [self.myScroll.distoryArray removeObjectAtIndex:sender.view.tag-100];
    [self.myScroll conFrame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
