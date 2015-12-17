//
//  CarStyleViewController.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"

@interface CarStyleViewController : BaseViewController


// data from CitySelected
@property (nonatomic, copy) NSString *provinceId;
@property (nonatomic, copy) NSString *cityId;

// data from push
@property (nonatomic, copy) NSString *carSeriesId;
@property (nonatomic, copy) NSString *carSalestate;


@end
