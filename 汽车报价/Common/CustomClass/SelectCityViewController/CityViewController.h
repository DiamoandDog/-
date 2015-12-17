//
//  CityViewController.h
//  车蚂蚁1.0
//
//  Created by 崔露凯 on 15/8/1.
//  Copyright (c) 2015年 郑逸凯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CityBlock)(NSString*);

@interface CityViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, copy) CityBlock cityBlock;

@end
