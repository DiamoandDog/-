//
//  BaseTabeView.h
//  汽车报价
//
//  Created by Fred on 15/9/24.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJRefreshTableHeaderView.h"
#import "CustomButton.h"

typedef void (^PullDownOrUpFinished)(void);

@interface BaseTabeView : UITableView<UITableViewDataSource,UITableViewDelegate,CJRefreshTableHeaderViewDelegate>

{
    CJRefreshTableHeaderView * _refreshHeaderView; // 下拉刷新头视图
    CustomButton *_refreshFooterButton; // 点击加载更多按钮
    
    
    BOOL _reloading ; //判断是否正在下拉加载数据中
    
    BOOL _uploading; //判断是否在上拉加载数据中
}


//| ----------------------------------------------------------------------------------
@property (nonatomic,strong) NSArray *data;

// defined properties of block for notification pullingdown refresh evernt
@property (nonatomic, copy) PullDownOrUpFinished pullDownBlock;
@property (nonatomic, copy) PullDownOrUpFinished pullUpBlock;
@property (nonatomic, copy) PullDownOrUpFinished touchTableViewBlock;


// 设置一个开关，来控制是否需要下拉刷新
@property (nonatomic,assign) BOOL isNeedPullingRefresh;

// 判断是否为最后一页，控制上拉控件的显示
@property(nonatomic, assign) BOOL isLastPage;


//| ----------------------------------------------------------------------------------

// 用来选择开启刷新模式
- (void)customRefreshTypeWithRefreshDown:(BOOL)down
                               RefreshUp:(BOOL)up
                         RefrehTouchView:(BOOL)touchView
                       RefreshTouchPoint:(BOOL)touchButton;





@end








