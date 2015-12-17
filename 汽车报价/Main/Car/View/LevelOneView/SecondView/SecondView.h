//
//  SecondView.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondTableView;

@interface SecondView : UIView

@property (nonatomic, strong) SecondTableView *secondeTableView;



//| ----------------------------------------------------------------------------------
// The data from network request and data from CarTableView

@property (nonatomic, strong) NSMutableArray *secondViewModelArray;

@property (nonatomic, strong) NSNumber *brandid;




@end

