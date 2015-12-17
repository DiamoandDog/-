//
//  SimilarViewController.m
//  汽车报价
//
//  Created by mac on 15/9/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SimilarViewController.h"
#import "SimilarModel.h"

@interface SimilarViewController ()

@end

@implementation SimilarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选结果";
    //self.view.backgroundColor = [UIColor grayColor];
    //创建表视图
    [self _createTableView];
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
    
    [self.view addSubview:tableView];
}



#pragma mark Delegate
#pragma mark -
#pragma mark UITableVIew DataSourece
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SimilarModel *model = _dataArray[section];
    return model.speclist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KScreenWidth, 30)];
        label1.tag = 100;
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, KScreenWidth, 30)];
        label2.tag = 200;
        [cell.contentView addSubview:label1];
        [cell.contentView addSubview:label2];
    }
    
    SimilarModel *model = _dataArray[indexPath.section];
    NSArray *array = model.speclist;
    
    NSMutableArray *specArray = [[NSMutableArray alloc] init];
    NSMutableArray *priceArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        NSString *specname = dic[@"specname"];
        NSNumber *priceNumber = dic[@"price"];
        
        [specArray addObject:specname];
        [priceArray addObject:priceNumber];
    }
    
    UILabel *specLabel = (UILabel *)[cell.contentView viewWithTag:100];
    UILabel *priceLabel = (UILabel *)[cell.contentView viewWithTag:200];
    specLabel.text = specArray[indexPath.row];
    NSNumber *princeNumber = priceArray[indexPath.row];
    CGFloat price = [princeNumber floatValue];
    priceLabel.text = [NSString stringWithFormat:@"指导价:%.2f万",price];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KScreenWidth, 30)];
    SimilarModel *model = _dataArray[section];
    label.text = model.name;
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
