//
//  SaleTableView.m
//  汽车报价
//
//  Created by imac on 15/9/25.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "SaleTableView.h"
#import "SaleModel.h"
#import "UIView+GetViewController.h"
#import "DetailTableViewController.h"


@implementation SaleTableView
{
    NSMutableArray *_saleData;
    SaleModel *_saleModel;
    DetailTableViewController *_detailVC;
    
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initTable];
        [self _loadData];
    }
    return self;
}



- (void)awakeFromNib{
    
    [self _initTable];
    [self _loadData];
    
}





-(void)_loadData
{
    // 1.构造URL
    NSURL *url = [NSURL URLWithString:@"http://baojia.qichecdn.com/priceapi3.9.9/services/promotionlist/get?provinceid=330000&cityid=330100&order=0&brandid=0&seriesid=0&specid=0&minprice=0&maxprice=0&levelid=0&pageindex=1&pagesize=20&pos=0"];
    // 2.构造网络请求NSMutableURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.设置请求信息
    // (1)请求方式
    request.HTTPMethod = @"GET";
    // (2)请求的超时时间
    request.timeoutInterval = 60;
    // (3)设置请求头
    //request.allHTTPHeaderFields = @{};
    //[request setValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>]
    // 4.构造连接对象NSURLConnection
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    // 同步申请网络，会一直等待，直到服务器返回数据后才能继续下面的任务，主线程会堵塞
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
   // NSLog(@"%@",data);
    if (error) {
        NSLog(@"error:%@",error);
        return;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //    NSLog(@"%@",dic);
    //    NSLog(@"%@",jsonString);
    NSDictionary *resultDic = dic[@"result"];
    NSArray *array = resultDic[@"selllist"];
    
    _saleData = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        _saleModel = [[SaleModel alloc] initWithDataDic:dic];
        
        [_saleData addObject:_saleModel];
        
    }
    
    
}




-(void)_initTable
{
    self.dataSource = self;
    self.delegate = self;
    //注册单元格
    UINib *nib  = [UINib nibWithNibName:@"SaleCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"SaleCellId"];
    

}

#pragma mark - TableView代理和数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _saleData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SaleCellId" forIndexPath:indexPath];
    cell.cellModel = _saleData[indexPath.row];
    _detailVC = [[DetailTableViewController alloc] init];
    _detailVC.saleModel = cell.cellModel;
    //获得 某个cell的布局对象（各个frame  weiboModel）
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  104;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _detailVC = [[DetailTableViewController alloc] init];
    _detailVC.hidesBottomBarWhenPushed = YES;
    [[self getNavigationController] pushViewController:_detailVC animated:YES];
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}











@end
