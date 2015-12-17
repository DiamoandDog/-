//
//  CarHeaderCollectionView.h
//  汽车报价
//
//  Created by Fred on 15/9/28.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseCollectionVeiw.h"

@interface CarHeaderCollectionView : BaseCollectionVeiw


//| ----------------------------------------------------------------------------------
//The data from CarTableView.
@property (nonatomic, strong) NSArray *hotBrandsCollectionModelArray;
@property (nonatomic, strong) NSArray *hotSeriesCollectionModelArray;

@property (nonatomic, strong) NSArray *focusListCollectionModelArray;


@end
