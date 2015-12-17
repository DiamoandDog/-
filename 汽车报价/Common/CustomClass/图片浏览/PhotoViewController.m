//
//  PhotoViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"

@interface PhotoViewController ()
{
    BOOL _isHidden;
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1.0];
    
    [self _customNavigationBar];
    
    [self _createViews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavigationBar) name:KHiddenNaVigationBarNOtificationName object:nil];
    
    
    
    
}

#pragma mark -
#pragma mark The HiddenNavigationBarNOtification's method Add remove the observer
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)hiddenNavigationBar
{
    _isHidden = !_isHidden;
    
    [self.navigationController setNavigationBarHidden:_isHidden animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KHiddenNaVigationBarNOtificationName object:nil];
}


#pragma mark -
#pragma mark CustomNavigationBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar
{
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;

    
    //|-----------------------------------------------------------------------------------
    //!Custom LeftBarButtonItem and RightBarButtonItems
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    leftBtn.tag = 100;
                         
    
    [leftBtn setImage:[UIImage imageNamed:@"uppage@2x"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(naviBarButtonItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    
    //| ----------------------------------------------------------------------------------
    UIButton *rightFirstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *rightSecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightFirstBtn.frame = CGRectMake(0, 0, 30, 30);
    rightSecondBtn.frame = CGRectMake(0, 0, 30, 30);
    rightFirstBtn.tag = 101;
    rightSecondBtn.tag = 102;
    
    
    [rightFirstBtn setImage:[UIImage imageNamed:@"datufenxiang@2x"] forState:UIControlStateNormal];
    [rightSecondBtn setImage:[UIImage imageNamed:@"baocun@2x"] forState:UIControlStateNormal];
    
    [rightFirstBtn addTarget:self action:@selector(naviBarButtonItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightSecondBtn addTarget:self action:@selector(naviBarButtonItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightFirstBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightFirstBtn];
    UIBarButtonItem *rightSecondBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightSecondBtn];
    
    self.navigationItem.rightBarButtonItems = @[rightFirstBtnItem,rightSecondBtnItem];
    
    
    
    
    
    

}

- (void)naviBarButtonItemsAction:(UIButton *)btn
{
    switch (btn.tag - 100) {
        case 0:
        {
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
            break;
        case 1:
        {
            
        }
            break;

            
        default:
            break;
    }
    
}


#pragma mark -
#pragma mark CreateViews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    //|-----------------------------------------------------------------------------------
    //!Create UICollectionView for subView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 30;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth + 30, KScreenHeight) collectionViewLayout:flowLayout];
    
    collectionView.bigURLArray = _bigImageURLArray;
    collectionView.largeURLArray = _LargeImageURLArray;

    
    [self.view addSubview:collectionView];
    
    
    
    [collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    

    
}

@end


























