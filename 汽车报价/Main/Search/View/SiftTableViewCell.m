//
//  SiftTableViewCell.m
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SiftTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DataService.h"
#import "SimilarModel.h"
#import "SimilarViewController.h"
#import "UIView+GetViewController.h"


@implementation SiftTableViewCell

- (void)setModel:(SearchModel *)model {
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    
    _seriesnameLabel.text = model.seriesname;
    
    NSNumber *min = model.minprice;
    NSNumber *max = model.maxprice;
    CGFloat minPrince = [min floatValue];
    CGFloat maxPrince = [max floatValue];
    _priceLabel.text = [NSString stringWithFormat:@"%.2f-%.2f万",minPrince,maxPrince];
    _priceLabel.textColor = [UIColor orangeColor];
    
    _fctnameLabel.text = [NSString stringWithFormat:@"%@/%@",model.fctname,model.levelname];
    _fctnameLabel.textColor = [UIColor lightGrayColor];
    _fctnameLabel.font = [UIFont systemFontOfSize:14];
    
    NSNumber *spec = model.speccount;
    NSInteger specCount = [spec integerValue];
    [_similarButton setTitle:[NSString stringWithFormat:@"共%li款车型符合条件>",specCount] forState:UIControlStateNormal];
    
    //给按钮添加点击事件
    [_similarButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction {
    NSNumber *seriesid = _model.seriesid;
    [_params setValue:seriesid forKey:@"seriesid"];
    NSString *urlString = @"findcaradvance/getresult";
    
    [DataService requestAFUrl:urlString httpMethod:@"GET" params:_params data:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSDictionary *resultDic = result[@"result"];
        NSArray *array = resultDic[@"serieslist"];
        NSMutableArray *smodelArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NSArray *engineArray = dic[@"enginelist"];
            for (NSDictionary *d in engineArray) {
                SimilarModel *model = [[SimilarModel alloc] initModelDataWithJsonDic:d];
                [smodelArray addObject:model];
//                NSLog(@"%@",model);
            }
        }
        
        SimilarViewController *similarVC = [[SimilarViewController alloc] init];
        similarVC.dataArray = smodelArray;
        
        [[self getViewController].navigationController pushViewController:similarVC animated:YES];
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
