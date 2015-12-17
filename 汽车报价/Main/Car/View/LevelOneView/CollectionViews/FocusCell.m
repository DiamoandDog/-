//
//  FocusCell.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//


#import "FocusCell.h"
#import "UIImageView+WebCache.h"
#import "FocusListModel.h"
#import "UIView+GetViewController.h"
#import "WebViewController.h"

#define KImageCountInScrollView 5

@implementation FocusCell
{
    NSTimer *_timer;
    UIPageControl *_pageControl;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    // Do any additional setup after loading nib file
    [self _customFirstCollctionCell];
}

#pragma mark -
#pragma mark Custom UICollectionViewCell - the first cell of headerViewCollctionView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customFirstCollctionCell
{
    //|-----------------------------------------------------------------------------------
    //!Create UIScrollView
    _headerscrollView.contentSize = CGSizeMake(KScreenWidth * 5.0, self.height);
    
    _headerscrollView.backgroundColor = [UIColor darkGrayColor];
    _headerscrollView.pagingEnabled = YES;
    _headerscrollView.showsHorizontalScrollIndicator = NO;
    _headerscrollView.showsVerticalScrollIndicator = NO;
    _headerscrollView.delegate = self;
    
    
    
    
    //| ----------------------------------------------------------------------------------
    //!Add GerstureRecognizer for _headerScrollView
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openWeb)];
    [_headerscrollView addGestureRecognizer:tap];
    
    
    
    
    //|-----------------------------------------------------------------------------------
    //!Create UIPageControl
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.width / 10 * 9, self.height / 7 * 6 , self.width / 10 , self.height / 7 )];
    
    _pageControl.numberOfPages = KImageCountInScrollView;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    
    
    [self insertSubview:_pageControl aboveSubview:_headerscrollView];
    
    //Open Timer to change currentPage automatically.
    [self _openTimer];
    
    
}


#pragma mark -
#pragma mark The UITapGestureRecognizer for openWeb
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)openWeb
{
    
    
    FocusListModel *model = [[FocusListModel alloc] init];
    
    model = _focusListCollectionCellModelArray[_pageControl.currentPage];
    
    UIViewController *currentViewController =  [_headerscrollView getViewController];
    
    UINavigationController *currenNavigationController = currentViewController.navigationController;
    
    WebViewController *web = [[WebViewController alloc] init];
    
    web.webUrl = model.foucusNewsURL;
    
    [currenNavigationController pushViewController:web animated:YES];
    
}


#pragma mark -
#pragma mark  Override Setter method for loading data for UIScroller's subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)setFocusListCollectionCellModelArray:(NSArray *)focusListCollectionCellModelArray
{
    if (_focusListCollectionCellModelArray != focusListCollectionCellModelArray) {
        
        _focusListCollectionCellModelArray = focusListCollectionCellModelArray;
        
        
        
            //| ----------------------------------------------------------------------------------
            //!Add data for UIScrollView
            for (NSInteger i = 0; i < KImageCountInScrollView; i++)
            {
                
                UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * i, 0, self.width, self.height)];
                
                FocusListModel *model = [[FocusListModel alloc] init];
                
                model = _focusListCollectionCellModelArray[i];
                
                [headImageView sd_setImageWithURL:[NSURL URLWithString:model.foucusImageURL ]];
                
                headImageView.contentMode = UIViewContentModeScaleToFill;
                
                [_headerscrollView addSubview:headImageView];
                
            }
    
        
    }
}




#pragma mark -
#pragma mark - open anf close Timer
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_openTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoPlayImage) userInfo:nil repeats:YES];
    
    //
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}


- (void)_closeTimer
{
    [_timer invalidate];
    
    _timer = nil;
    
}


- (void)autoPlayImage
{
    NSInteger currentPage = _pageControl.currentPage;
    
    if (currentPage == KImageCountInScrollView -1 ) {
        currentPage = -1;
    }
    
    currentPage++;
    
    NSParameterAssert(currentPage >= 0 && currentPage <= 5);
    
    [_headerscrollView setContentOffset:CGPointMake(currentPage * self.width, 0) animated:YES];
    
}


#pragma mark-
#pragma mark UIScrollView delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = (scrollView.width * 0.5f + _headerscrollView.contentOffset.x )/ _headerscrollView.width;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self _closeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self _openTimer];
}
@end
