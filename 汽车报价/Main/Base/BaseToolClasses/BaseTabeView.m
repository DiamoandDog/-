//
//  BaseTabeView.m
//  汽车报价
//
//  Created by Fred on 15/9/24.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseTabeView.h"

@implementation BaseTabeView
{
    UIActivityIndicatorView *_loadingView;
    

    
    BOOL _isNeedRefreshDown;
    BOOL _isNeedRefreshUp;
    BOOL _isNeedRefreshTouchView;
    BOOL _isNeedRefreshTouchButton;
}


- (void)viewDidLoad {
    
}



#pragma mark -
#pragma mark initialization methods
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self customRefreshTypeWithRefreshDown:NO
                                     RefreshUp:NO
                               RefrehTouchView:NO
                             RefreshTouchPoint:NO];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self customRefreshTypeWithRefreshDown:NO
                                 RefreshUp:NO
                           RefrehTouchView:NO
                         RefreshTouchPoint:NO];
}




#pragma mark -
#pragma mark Private method - Create subviews and so on
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)customRefreshTypeWithRefreshDown:(BOOL)down
                              RefreshUp:(BOOL)up
                        RefrehTouchView:(BOOL)touchView
                      RefreshTouchPoint:(BOOL)touchButton
{
    _isNeedRefreshDown = down;
    _isNeedRefreshUp = up;
    _isNeedRefreshTouchView = touchView;
    _isNeedRefreshTouchButton = touchButton;
    
    [self createViews];
    
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)createViews
{
    
    
    //| ----------------------------------------------------------------------------------
    self.delegate = self;
    self.dataSource = self;
    
    
        // 默认需要下拉刷新
    _isNeedPullingRefresh = YES;
    
    
    //| ----------------------------------------------------------------------------------
    //!创建下拉刷新头视图
    
    if (_isNeedRefreshDown) {
        
        _refreshHeaderView = [[CJRefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.height , self.width, self.height)];
        
        [self addSubview:_refreshHeaderView];
        
        [_refreshHeaderView readLastUpdateTime];
        

    }

    
    //|-----------------------------------------------------------------------------------
    //!创建点击加载更多按钮控件(Default: tableFooterButton.height = 44 )
    if (_isNeedRefreshTouchButton || _isNeedRefreshUp) {
        
        _refreshFooterButton = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, self.width, 44)];
        
        _refreshFooterButton.layoutStyle = LeftImageRightLableHorizontalLayout;
        _refreshFooterButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.6];
        _refreshFooterButton.normalTitleColor = [UIColor darkGrayColor];
        
        if (_isNeedRefreshUp) {
            _refreshFooterButton.titleLabel.text = @"上拉加载更多...";

        }

        _refreshFooterButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        if (_isNeedRefreshTouchButton) {
            
            _refreshFooterButton.titleLabel.text = @"点击加载更多...";

            [_refreshFooterButton addTarget:self action:@selector(refreshFooterButtonAction) forControlEvents:UIControlEventTouchUpInside];
        }
        self.tableFooterView = _refreshFooterButton;
        
        
        //| ----------------------------------------------------------------------------------
        // 风火轮
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _loadingView.frame = CGRectMake((self.width / 4.0 - 20.0) / 2.0, 10, self.width / 8.0 , 24);
        
        
        _loadingView.hidesWhenStopped = YES;
        [_loadingView stopAnimating];
        
        
        [_refreshFooterButton addSubview:_loadingView];
        
        }
    //|-----------------------------------------------------------------------------------
    //!Add GestureReconizer for tableView for loading data
    if (_isNeedRefreshTouchView) {
        
        UITapGestureRecognizer *tapRefresh = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRefreshTableView)];
        tapRefresh.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapRefresh];


        
    }
    
    
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)tapRefreshTableView
{
    if (self.touchTableViewBlock) {
        
        self.touchTableViewBlock();
    }
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)refreshFooterButtonAction
{
    _uploading = YES;
    
    _refreshFooterButton.enabled = NO;
    
    _refreshFooterButton.titleLabel.text = @"加载中....";
    
    [_loadingView startAnimating];
    
    // Callback block to loading data
    if (self.pullUpBlock) {
        
        self.pullUpBlock();
    }
    
    [self performSelector:@selector(setIsLastPage:) withObject:nil afterDelay:0.1];
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_reloadTableViewDataSource{
    
    _reloading = YES;
    
}


- (void)completeLoadingTableViewDate
{
    _reloading = NO;
    //收回下拉控件
    [_refreshHeaderView CJRefreshTableHeaderViewDataSourceDidFinishedLoading:self];
    
}






#pragma mark - 
#pragma mark Override the setter methods of properties
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        if (data.count > 0) {
            
        }else
        {
            
        }
    }
}

-(void)setIsNeedPullingRefresh:(BOOL)isNeedPullingRefresh
{
    _isNeedPullingRefresh = isNeedPullingRefresh;
    if (!_isNeedPullingRefresh) {
        [_refreshHeaderView removeFromSuperview];
    }
}

- (void)setIsLastPage:(BOOL)isLastPage {
    
    
    _isLastPage = isLastPage;
    
    if (!isLastPage) {
        _refreshFooterButton.titleLabel.text = @"上拉加载更多";
        _refreshFooterButton.enabled = YES;
    }
    else {
        _refreshFooterButton.titleLabel.text = @"加载完成";
        _refreshFooterButton.enabled = NO;
    }
    
    
    
    [_loadingView stopAnimating];
    
    _uploading = NO;
    
}




#pragma mark - Delegate
#pragma mark -
#pragma mark -UIScrollView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_isNeedRefreshDown || _isNeedRefreshUp) {
        
        [_refreshHeaderView CJRefreshTableHeaderViewDidScroll:scrollView];
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_isNeedRefreshDown || _isNeedRefreshUp) {
        
        [_refreshHeaderView CJRefreshTableHeaderViewDidEndDragging:scrollView];
    }
    
    
    //| ----------------------------------------------------------------------------------
    //!判断上拉偏移量，来确定是否触发上拉加载 ｜｜ 当滑动到底部时：滑动的偏移量＋视图的高度 ＝ 内容高度
    //The size of the content view.
    CGFloat h1 = scrollView.contentOffset.y +CGRectGetHeight(scrollView.bounds);
    CGFloat h2 = scrollView.contentSize.height;
    
   // NSLog(@"h1:%.2f,h2:%.2f", h1,h2); //test😊😊😊😊😊😊😊😊😊😊😊test
    
    
    // 判断是否需要上拉加载功能
    if (_isNeedRefreshUp)
    {
        if (h1 - h2 > 30 && !_uploading)
        {
            
            [self refreshFooterButtonAction];
        }

    }
}


#pragma mark -
#pragma mark CJRefreshTableHeaderView Delegate 
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)CJRefreshTableHeaderViewDidTriggerRefresh:(CJRefreshTableHeaderView *)view
{
    [self _reloadTableViewDataSource];
    
    if (self.pullDownBlock) {
        
        self.pullDownBlock();
    }
}


- (BOOL)CJRefreshTableHeaderViewDataSourceIsLoading:(CJRefreshTableHeaderView *)view
{
    return _reloading;
}


- (NSDate *)CJRefreshTableHeaderViewDataSourceLastUpdated:(CJRefreshTableHeaderView *)view
{
    return [NSDate date];
}


#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}




@end
