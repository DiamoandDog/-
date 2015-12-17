//
//  CJRefreshTableHeaderView.h
//  01-Weibo
//
//  Created by Fred on 15/9/15.
//  Copyright (c) 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

// 刷新状态
typedef enum {
    CJPullRefreshPulling = 0,  // 下拉状态（手指向下滑动状态）
    CJPullRefreshNormal,       // 正常状态
    CJPullRefreshLoading,      // 加载数据状态（手指离开屏幕反弹状态）
    
} CJPullRefreshState;


// Declaration Delegate
@protocol  CJRefreshTableHeaderViewDelegate;

@interface CJRefreshTableHeaderView : UIView {
  
    CJPullRefreshState _state;  // 刷新状态
    
    UILabel *_lastUpdatedLabel; // 此一次更新微博的时间
    UILabel *_statusLabel;      // 上拉刷新状态显示
    CALayer *_arrowImage;       // 上拉刷新箭头视图
    UIActivityIndicatorView *_activityView;  // 风火轮视图
    
    
}

@property (nonatomic, assign) id <CJRefreshTableHeaderViewDelegate> delegate;


- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)texcolor;

// 获取上一次更新时间
- (void)refreshLastUpdatedDate;

// 读取本地存储的上次更新的时间
- (void)readLastUpdateTime;

// 视图滑动时调用
- (void)CJRefreshTableHeaderViewDidScroll:(UIScrollView *)scrollView;

// 手指离开屏幕时调用
- (void)CJRefreshTableHeaderViewDidEndDragging:(UIScrollView *)scrollView;

//数据加载完成时调用
- (void)CJRefreshTableHeaderViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;



@end

@protocol  CJRefreshTableHeaderViewDelegate <NSObject>

@required

// 触发刷新时调用
- (void)CJRefreshTableHeaderViewDidTriggerRefresh:(CJRefreshTableHeaderView *)view;

// 数据正在加载时调用
- (BOOL)CJRefreshTableHeaderViewDataSourceIsLoading:(CJRefreshTableHeaderView *)view;

@optional

//与上次数据加载时相关
- (NSDate *)CJRefreshTableHeaderViewDataSourceLastUpdated:(CJRefreshTableHeaderView *)view;

@end
