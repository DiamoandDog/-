//
//  MyCollectionViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "MyColletionTableView.h"

@interface MyCollectionViewController : BaseViewController

//subviews
@property (nonatomic, strong) MyColletionTableView *tableView;


//Data from the network request
@property (nonatomic, strong) NSMutableArray *myCollectionModelArray;



@end
