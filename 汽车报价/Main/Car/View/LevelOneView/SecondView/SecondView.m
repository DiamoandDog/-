//
//  SecondView.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SecondView.h"
#import "SecondTableView.h"
#import "CustomNetworkRequest.h"

#import "SecondSectionModel.h"

@implementation SecondView
{
    BOOL _isSaleCar;
    UISegmentedControl *_saleSegmented;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //Do additional setup after initialization
        [self _createViews];
        
    }
    
    return self;
}
         
- (void)_loadData
{
    
    
        NSString *brandid = [NSString stringWithFormat:@"%ld",[_brandid integerValue]];
    
        NSString *salestate;
    
    if (_isSaleCar)
    {
        
        salestate = @"1";
    }else
    {
        salestate = @"3";
    }
    
        NSDictionary *params = @{
                                 
                                 @"brandid":brandid,
                                 @"salestate":salestate,
                                 @"cityid":@331000
                                 
                                 };
    
    
        [CustomNetworkRequest requestWithURL:KSecondViewURL params:(NSMutableDictionary *)params httpMethod:@"GET" requestHeader:nil block:^(id result) {
            
            NSDictionary *resultDic = result[@"result"];
            NSDictionary *fctlistDic = resultDic[@"fctlist"];
            
            _secondViewModelArray = [NSMutableArray array];
            
            for (NSDictionary *dic in fctlistDic) {
                
                SecondSectionModel *model = [[SecondSectionModel alloc] initWithDictionary:dic];
                
                [_secondViewModelArray addObject:model];
            }
            
            _secondeTableView.secondTableModelArray = _secondViewModelArray;
            
            
        }];
}
         
         
         

- (void)_createViews
{
     
    _saleSegmented = [[UISegmentedControl alloc] initWithItems:@[@"在售车型",@"停售车型"]];
    _saleSegmented.frame = CGRectMake(10, 10, self.width - 20, 30);
    
    _saleSegmented.tintColor = [UIColor darkGrayColor];
    
    
    
    [_saleSegmented addTarget:self action:@selector(saleSegmentedAction:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_saleSegmented];
    
    _secondeTableView = [[SecondTableView alloc] initWithFrame:CGRectMake(0, 40, self.width, self.height - 40)];
    
    [self addSubview:_secondeTableView];
}


- (void)saleSegmentedAction:(UISegmentedControl *)saleSegmented
{
    
    if (saleSegmented.selectedSegmentIndex == 0) {
        
        _isSaleCar = YES;
        [self _loadData];
        
    }else{
        
        _isSaleCar = NO;
        [self _loadData];
    }
}


#pragma mark -
#pragma mark Override setter methods for Refesh data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)setBrandid:(NSNumber *)brandid
{
    if (_brandid != brandid) {
        
        _brandid = brandid;
        
        if (_saleSegmented.selectedSegmentIndex > 0) {
            _isSaleCar = NO;
        }else
        {
        _saleSegmented.selectedSegmentIndex = 0;
        _isSaleCar = YES;
        }
        [self _loadData];
    }
}






@end






















