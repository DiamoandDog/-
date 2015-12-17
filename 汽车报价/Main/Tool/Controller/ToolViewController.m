//
//  ToolViewController.m
//  汽车报价
//
//  Created by 张泽宏 on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ToolViewController.h"
#import "CustomButton.h"
//push
#import "MyCollectionViewController.h"
#import "ScanHistoryViewController.h"
#import "SaleListViewController.h"


@interface ToolViewController ()

@end



@implementation ToolViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"工具";

    [super customNavigationBarWithTitle:NO];
    
    [self _createViews];
    
    
    
    
}


#pragma mark -
#pragma mark CreateViews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    
    
    //| ----------------------------------------------------------------------------------
    CustomButton *firstBtn = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 60)];
    
    firstBtn.layoutStyle = TwoLableVerticalLayout;
    
    firstBtn.titleLabel.text = @"小编精选的二手车源APP";
    firstBtn.detailTitleLable.text = @"小编精选的二手车源APP";
    firstBtn.titleLabel.textColor = [UIColor colorWithRed:0.99 green:0.25 blue:0 alpha:1.0]

;
    firstBtn.detailTitleLable.textColor = [UIColor darkGrayColor];
    
    firstBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    firstBtn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:firstBtn];
    
    
    
    //| ----------------------------------------------------------------------------------
    CGFloat btnWidth = (KScreenWidth - 1.0)  / 2.0;
    CGFloat btnHeight = (KScreenHeight - KTableBarHeight -KNavigationBarHeight - firstBtn.height - 1.0 - 6.0) / 5.0 ;
    
    NSArray *titleArray = @[@[
                            @"我的收藏",
                            @"车型对比",
                            @"浏览历史",
                            @"保值查询",
                            @"厂商活动"
                             ],
                            
                            @[
                                @"我的订单",
                                @"购买计算器",
                                @"热销车",
                                @"好友帮选车",
                                @""
                                
                              ]
                            ];
    
    
    NSArray *normalImgeNameArray = @[@[@"tools_collect@2x",
                                       @"tools_pk@2x",
                                       @"tools_history@2x",
                                       @"tools_baozhi@2x",
                                       @"tools_vendor@2x"]
                                     
                                     ,@[@"tools_order@2x",
                                        @"tools_calculator@2x",
                                        @"tools_hot@2x",
                                        @"tools_help@2x",
                                        @""]
                                     
                                     
                                     ];
    
    
    
    for (NSInteger i = 0; i < 2; i++) {
        
        
            for (NSInteger j = 0; j < 5; j++) {
                
                if (i == 1 && j == 4) {
                    
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake((btnWidth + 1.0 )*i  ,(btnHeight + 1.0) * j + 1.0 + firstBtn.height, btnWidth, btnHeight)];
                    bgView.backgroundColor = [UIColor whiteColor];
                    
                    [self.view addSubview:bgView];

                    
                }
                else
                {
                    CustomButton *btn = [[CustomButton alloc] initWithFrame:CGRectMake((btnWidth + 1.0 )*i  ,(btnHeight + 1.0) * j + 1.0 + firstBtn.height, btnWidth, btnHeight)];
                    
                    btn.layoutStyle = TopImageBottomLableVerticalLayout;
                    
                    btn.titleLabel.text = titleArray[i][j];
                    btn.normalImageName = normalImgeNameArray[i][j];
                    btn.tag = 100 + (i * 5 + j);
                    
                    btn.titleLabel.textColor = [UIColor darkGrayColor];
                    btn.titleLabel.font = [UIFont systemFontOfSize:16];
                    btn.backgroundColor = [UIColor whiteColor];
                    
                    [btn addTarget:self action:@selector(btnActon:) forControlEvents:UIControlEventTouchUpInside];
                    
                    [self.view addSubview:btn];
                }
                
        
        }
        
    }
    
}

- (void)btnActon:(CustomButton *)btn
{
    switch (btn.tag - 100) {
        case 0:
        {
            MyCollectionViewController *mycollectionCtrl = [[MyCollectionViewController alloc] init];
            
            [self.navigationController pushViewController:mycollectionCtrl animated:YES];
            
        }
            break;
        case 1:
        {
            
        }
            break;

        case 2:
        {
            ScanHistoryViewController *scanHistroyCtrl = [[ScanHistoryViewController alloc] init];
            
            [self.navigationController pushViewController:scanHistroyCtrl animated:YES];
        }
            break;

        case 3:
        {
            
        }
            break;

        case 4:
        {
            
        }
            break;

        case 5:
        {
            
        }
            break;

        case 6:
        {
                    }
            break;

        case 7:
        {
            SaleListViewController *saleListCtrl = [[SaleListViewController alloc] init];
            
            [self.navigationController pushViewController:saleListCtrl animated:YES];

        }
       
        default:
            
            break;
    }
}


@end
