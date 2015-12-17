//
//  SearchViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableView.h"
#import "AFNetworking.h"
#import "DataService.h"
#import "SiftViewController.h"
#import "SearchModel.h"



@interface SearchViewController ()

@end

@implementation SearchViewController
{
    SearchTableView *tableView;//表视图
    UIButton *searchButton;//搜索按钮
    NSString *_session;//汽车详情列表请求参数
    NSMutableArray *modelArray;//存放数据模型的数组
    NSMutableDictionary *params;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义导航栏
    [self _navigationBarCustom];
    //创建表视图
    [self _createTableView];
    //添加找车按钮
    [self _createSearchButton];
    //搜索全部符合条件车型数量
    [self _loadCarCount];
    
    __weak UIButton *weakSearchButton = searchButton;
    tableView.block = ^(NSString *session,NSInteger count) {
        _session = session;
        [weakSearchButton setTitle:[NSString stringWithFormat:@"共%li个车系符合条件>",count] forState:UIControlStateNormal];
    };
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_navigationBarCustom {
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(0, 0, 30, 30);
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"tab_Search"] forState:UIControlStateNormal];
    [leftbutton setBackgroundImage:[UIImage imageNamed:@"tab_Search_b"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.title = @"精准找车";
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createTableView {
    
    tableView = [[SearchTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    
    tableView.contentInset = UIEdgeInsetsMake(0, 0,150, 0);
    
    
    [self.view addSubview:tableView];
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createSearchButton {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight -KNavigationBarHeight -KStatuesHeight - KTableBarHeight - 30, KScreenWidth, 50)];
    
    bgView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:bgView];
    
    //| ----------------------------------------------------------------------------------
    
    searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    searchButton.frame = CGRectMake(10, 5, KScreenWidth - 20, 40);
    
    [searchButton setTitle:[NSString stringWithFormat:@"共0个车系符合条件>"] forState:UIControlStateNormal];
    
    [searchButton addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:searchButton];
    searchButton.backgroundColor = [UIColor greenColor];
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_loadCarCount {
    
    
    NSString *urlString = @"findcaradvance/search";
    [DataService requestAFUrl:urlString httpMethod:@"GET" params:nil data:nil block:^(id result) {
        //NSLog(@"%@",result);
        NSDictionary *resultDic = [result valueForKeyPath:@"result"];
        _session = resultDic[@"session"];
        //NSLog(@"%@",_session);
        NSNumber *number = [resultDic valueForKeyPath:@"rowcount"];
        NSInteger i = [number integerValue];
        [searchButton setTitle:[NSString stringWithFormat:@"共%li个车系符合条件>",i] forState:UIControlStateNormal];
    }];
}


//searchButton按钮点击方法
- (void)searchButtonAction {
    
    
    
    NSString *urlString = @"findcaradvance/getresult";
    //请求参数
    params = [[NSMutableDictionary alloc] init];
    [params setObject:_session forKey:@"session"];
    [params setObject:@3 forKey:@"order"];
    //用来存放model的数组
    modelArray = [[NSMutableArray alloc] init];
    [DataService requestAFUrl:urlString httpMethod:@"GET" params:params data:nil block:^(id result) {
        //NSLog(@"%@",result);
        NSDictionary *resultDic = result[@"result"];
        NSArray *array = resultDic[@"serieslist"];
        
        for (NSDictionary *dic in array) {
            SearchModel *model = [[SearchModel alloc] initModelDataWithJsonDic:dic];
            [modelArray addObject:model];
        }
        //点击按钮进入筛选页面
        SiftViewController *siftVC = [[SiftViewController alloc] init];
        siftVC.view.backgroundColor = [UIColor grayColor];
        //将数据传给siftVC
        siftVC.params = params;
        siftVC.dataArray = modelArray;
        siftVC.session = _session;
        [self.navigationController pushViewController:siftVC animated:YES];
    }];

}







@end
