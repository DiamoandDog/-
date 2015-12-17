//
//  DealerTableView.m
//  汽车报价
//
//  Created by imac on 15/10/8.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "DealerTableView.h"

@implementation DealerTableView
{
    NSMutableArray *_dealerData;
    DealerModel *_dealerModel;

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

-(void)_initTable
{
    self.dataSource = self;
    self.delegate = self;
    //注册单元格
    UINib *nib  = [UINib nibWithNibName:@"DealerCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"DealerCellId"];
    
}

-(void)_loadData
{
    
    // 1.构造URL
    NSURL *url = [NSURL URLWithString:@"http://baojia.qichecdn.com/priceapi3.9.9/services/dealerOrderList/get?provinceId=330000&cityId=330100&countyId=0&brandId=0&factoryId=0&seriesId=0&pageIndex=1&pageSize=20&order=0&lat=0&lon=0"];
    
    // 2.构造网络请求NSMutableURLRequest
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.设置请求信息
    // (1)请求方式
    request.HTTPMethod = @"GET";
    // (2)请求的超时时间
    request.timeoutInterval = 60;
    
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    // 同步申请网络，会一直等待，直到服务器返回数据后才能继续下面的任务，主线程会堵塞
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"error:%@",error);
        
        return;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *resultDic = dic[@"result"];
    NSArray *array = resultDic[@"list"];
    
    _dealerData = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        
        _dealerModel = [[DealerModel alloc] initWithDataDic:dic];
        [_dealerData addObject:_dealerModel];
        
    }

}


#pragma mark - TableView代理和数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dealerData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DealerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DealerCellId" forIndexPath:indexPath];
    cell.dealerModel = _dealerData[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  118;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    }


@end
