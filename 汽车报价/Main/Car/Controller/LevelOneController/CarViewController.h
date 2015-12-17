//
//  CarViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "CarTableView.h"
#import "CarHeaderCollectionView.h"
#import "SecondView.h"
#import "CarTableView.h"


@interface CarViewController : BaseViewController


//|-----------------------------------------------------------------------------------
//!Subviews
@property (nonatomic, strong) CarTableView *carTableView;

@property (nonatomic, strong) SecondView *secondView;


//| ----------------------------------------------------------------------------------
// LevelOne  Model data from network request.
@property (nonatomic, strong) NSMutableArray *focusListModelArray;
@property (nonatomic, strong) NSMutableArray *hotBrandsModelArray;
@property (nonatomic, strong) NSMutableArray *hotSeriesModelArray;
@property (nonatomic, strong) NSMutableArray *brandListsectonModelArray;




@end
