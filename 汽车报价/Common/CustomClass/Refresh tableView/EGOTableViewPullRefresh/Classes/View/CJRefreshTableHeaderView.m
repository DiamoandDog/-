//
//  CJRefreshTableHeaderView.m
//  01-Weibo
//
//  Created by Fred on 15/9/15.
//  Copyright (c) 2015年 陈建军. All rights reserved.
//

#import "CJRefreshTableHeaderView.h"


#define KTextColor [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define KFlip_Animation_Duration 0.18f


@interface CJRefreshTableHeaderView (Private)

- (void)_setState:(CJPullRefreshState)aState; //下拉刷新状态设置

@end


@implementation CJRefreshTableHeaderView


#pragma mark -
#pragma mark Custom initialization and default initialization  for Refresh view
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
/*!
*  @brief  初始化下拉刷新视图
*  @param frame     下拉刷新视图的Frame
*  @param arrow     下拉箭头图片名称
*  @param textcolor 下拉视图子视图（label的颜色）
*  @return 初始化后的下拉刷新视图
*  @since 1.0
*/
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textcolor
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        /**********************************************************************************
         🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷StudyStudy🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷
         在 UIView 中有一个autoresizingMask的属性，它对应的是一个枚举的值（如下），属性的意思就是自动调
         整子控件与父控件中间的位置，宽高
         enum {
         UIViewAutoresizingNone                 = 0,
         UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
         UIViewAutoresizingFlexibleWidth        = 1 << 1,
         UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
         UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
         UIViewAutoresizingFlexibleHeight       = 1 << 4,
         UIViewAutoresizingFlexibleBottomMargin = 1 << 5
         };
         ********************************************************************************/
        
        //| ----------------------------------------------------------------------------
        //! 自动调整自己的宽度，保证与superView左边和右边的距离不变
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;

        self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        
        //| ----------------------------------------------------------------------------------
        // 上一次下拉刷新的时间label创建
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
        
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.textColor = textcolor;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        _lastUpdatedLabel = label;
        
        //| ----------------------------------------------------------------------------------
        //上拉刷新状态label创建
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f , self.frame.size.width, 20.0f)];
        
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont boldSystemFontOfSize:13.0f];
        label.textColor = textcolor;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _statusLabel = label;
        
        //| ----------------------------------------------------------------------------------
        // 上拉刷新箭头视图创建
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
        
        
        layer.contentsGravity = kCAGravityResizeAspect;
        layer.contents = (id)[UIImage imageNamed:arrow].CGImage;
        
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        {
            layer.contentsScale = [[UIScreen mainScreen] scale];
        }
#endif
        
        [[self layer] addSublayer:layer];
        _arrowImage = layer;
        
        
        //| ----------------------------------------------------------------------------------
        // 上拉刷新风火轮视图创建
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        activityView.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
        
        [self addSubview:activityView];
        _activityView = activityView;
        
        
        // 设置上拉刷新状态为 正常状态
        [self _setState:CJPullRefreshNormal];

        
        
    }
    return self;
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame arrowImageName:@"blackArrow@2x" textColor:KTextColor];
}




#pragma mark -
#pragma mark Private methods
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
/*!
 *  @brief  下拉状态相关参数设置
 *  @param aState 下拉状态
 *  @since 1.0
 */
- (void)_setState:(CJPullRefreshState)aState
{
    switch (aState) {
        case CJPullRefreshPulling:
            
            _statusLabel.text = NSLocalizedString(@"Release to refresh...", @"Release to refresh status");
            [CATransaction begin];
            [CATransaction setAnimationDuration:KFlip_Animation_Duration];
            _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
            [CATransaction commit];
            
            break;
        case CJPullRefreshNormal:
            
            if (_state == CJPullRefreshNormal) {
                [CATransaction begin];
                [CATransaction setAnimationDuration:KFlip_Animation_Duration];
                _arrowImage.transform = CATransform3DIdentity;
                [CATransaction commit];
            }
            
            _statusLabel.text = NSLocalizedString(@"Pull down to refresh...", @"Pull down to refresh status");
            [_activityView stopAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
            _arrowImage.hidden = NO;
            _arrowImage.transform = CATransform3DIdentity;
            [CATransaction commit];
            
            [self refreshLastUpdatedDate];
            
            break;
        case CJPullRefreshLoading:
            
            _statusLabel.text = NSLocalizedString(@"Loading...", @"Loading Status");
            [_activityView startAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
            _arrowImage.hidden = YES;
            [CATransaction commit];
            
            break;
        default:
            break;
    }
    
    _state = aState;

}





#pragma mark -
#pragma mark RefreshLastUpdateDate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)refreshLastUpdatedDate
{
    if ([_delegate respondsToSelector:@selector(CJRefreshTableHeaderViewDataSourceLastUpdated:)]) {
        NSDate *date =[_delegate CJRefreshTableHeaderViewDataSourceLastUpdated:self];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        dateFormatter.AMSymbol = @"上午";
        dateFormatter.PMSymbol = @"下午";
        dateFormatter.dateFormat = @"yyyy/MM/dd aa hh:mm:ss";
        
       _lastUpdatedLabel.text = [NSString stringWithFormat:@"上一次更新时间: %@", [dateFormatter stringFromDate:date]];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"CJRefreshLastUpdateDate" forKey:_lastUpdatedLabel.text];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        _lastUpdatedLabel.text = nil;
    }
    
}

//取得下拉刷新的时间
- (NSDate *)CJRefreshTableHeaderViewDataSourceLastUpdated:(CJRefreshTableHeaderView *)view
{
    return [NSDate date];
}

//读取上次刷新的时间
- (void)readLastUpdateTime
{
    _lastUpdatedLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"EGORefreshTableView_LastRefresh"];
}


#pragma mark -
#pragma mark Methods will be called, when UIScrollView delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//call on any offset changes
-(void)CJRefreshTableHeaderViewDidScroll:(UIScrollView *)scrollView
{
    if (_state == CJPullRefreshPulling)
    {
        
        CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
        offset = MIN(offset, 60);
        scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
        
    }
    /**********************************************************************************
     // returns YES if user has touched. may not yet have started dragging
     @property(nonatomic,readonly,getter=isDragging)
     ********************************************************************************/
    
    
    else if (scrollView.isDragging)
    {
        
        BOOL _loading = NO;
        
        if ([_delegate respondsToSelector:@selector(CJRefreshTableHeaderViewDataSourceIsLoading:)])
        {
            _loading = [_delegate CJRefreshTableHeaderViewDataSourceIsLoading:self];
        }
        
        
        if (_state == CJPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading)
        {
            [self _setState:CJPullRefreshNormal];
            
        }
        else if (_state == CJPullRefreshNormal && scrollView.contentOffset.y < -65.0f && !_loading)
        {
            [self _setState:CJPullRefreshPulling];
        }
        
        if (scrollView.contentInset.top != 0)
        {
            scrollView.contentInset = UIEdgeInsetsZero;
        }
        
    }

    
}

-(void)CJRefreshTableHeaderViewDidEndDragging:(UIScrollView *)scrollView
{
    BOOL _loading = NO;
    if ([_delegate respondsToSelector:@selector(CJRefreshTableHeaderViewDataSourceIsLoading:)]) {
        _loading = [_delegate CJRefreshTableHeaderViewDataSourceIsLoading:self];
    }
    
    if (scrollView.contentOffset.y <= - 65.0f && !_loading) {
        
        if ([_delegate respondsToSelector:@selector(CJRefreshTableHeaderViewDidTriggerRefresh:)]) {
            [_delegate CJRefreshTableHeaderViewDidTriggerRefresh:self];
        }
        
        [self _setState:CJPullRefreshLoading];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
        [UIView commitAnimations];
        
    }

}

#pragma mark -
#pragma mark call on FinishedLoading data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)CJRefreshTableHeaderViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    [scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [UIView commitAnimations];
    
    [self _setState:CJPullRefreshNormal];
    
}












@end












































