//
//  SiftViewController.m
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SiftViewController.h"
#import "SiftTableView.h"
#import "MJRefresh.h"
#import "SearchModel.h"
#import "DataService.h"

@interface SiftViewController ()

@end

@implementation SiftViewController {
    SiftTableView *tableView;
    NSMutableArray *modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选结果";

}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    tableView.modelArray = dataArray;
    tableView.params = _params;
    [tableView reloadData];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self _initTableView];
    }
    return self;
}

- (void)_initTableView {
    tableView = [[SiftTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
}

- (void)_loadMoreData {
    //通过管理对象发送网络请求
    NSString *urlString = @"findcaradvance/getresult";
    //请求参数
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:_session forKey:@"session"];
//    [params setObject:@3 forKey:@"order"];
    //用来存放model的数组
    modelArray = [[NSMutableArray alloc] init];
    [DataService requestAFUrl:urlString httpMethod:@"GET" params:_params data:nil block:^(id result) {
        NSDictionary *resultDic = result[@"result"];
        NSArray *array = resultDic[@"serieslist"];
        
        for (NSDictionary *dic in array) {
            SearchModel *model = [[SearchModel alloc] initModelDataWithJsonDic:dic];
            [modelArray addObject:model];
        }
        [_dataArray addObjectsFromArray:modelArray];
        tableView.modelArray = _dataArray;
        [tableView reloadData];
        [tableView.footer endRefreshing];
    }];
}

- (void)_loadNewData {
    [tableView.header performSelector:@selector(endRefreshing) withObject:nil afterDelay:1];
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
