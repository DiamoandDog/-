//
//  Common.h
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#ifndef Common_h
#define Common_h


//| ----------------------------------------------------------------------------
//! 屏幕宽高 ｜｜ 导航栏高度 ｜｜ 标签栏高度 || 状态栏高度
//
#define  KScreenHeight [UIScreen mainScreen].bounds.size.height
#define  KScreenWidth  [UIScreen mainScreen].bounds.size.width

#define  KNavigationBarHeight 64
#define  KTableBarHeight      49
#define  KStatuesHeight       20


//判断是否是iOS7以上
#define ios7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define ios8 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)


//|-----------------------------------------------------------------------------------
//!NOtifications
#define KUICollectionLoadingMorePicNOtificationName  @"KUICollectionLoadingMorePicNOtificationName "

#define KHiddenNaVigationBarNOtificationName @"KHiddenNaVigationBarNOtificationName"



//|-----------------------------------------------------------------------------------
//!The public

#import "UIViewExt.h"  // Using for simple get size of view simply



//|-----------------------------------------------------------------------------------
//!User Information
#define KUserID @"351758051124178"



//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//! Network Request URL for Car Page
#define KFocusURL          @"focuspictures/get"
#define KCarsURL           @"cars/brands"
#define KHotSeriesURL      @"zhudache/get"
#define KSecondViewURL     @"seriesprice/get"

//|-----------------------------------------------------------------------------------
//!Tools Bar

// 1.我的收藏
#define KMyCollectionFavSerisesURL @"user/getfavseries"         // 喜欢车系
#define KMyCollectionFavSpecURL       @"user/getfavspec"           // 喜欢车型
#define KMyCollectionFavDealerURL     @"userFavDealer/getFavDealer"// 喜欢经销商

// 2.新车上市
#define KNewCarsURL        @"newcars/get"
#define KUpComingSalesURL  @"upcomingsales/get"

// 3.销量排行
#define KSaleListURL       @"hotcar/get"

// 5.附近经销商
#define KDealerHomePageURL @"dealerHomePage/get"
#define KDealerOrderList   @"dealerOrderList/get"


//|-----------------------------------------------------------------------------------
//!The car seriessummary

// 一级页面
#define KCarDetailURL      @"seriessummary/get"
#define KFUdongCarURL      @"fudong/get"
#define KFavorSeriesURl    @"user/setfavseries"

//二级页面
#define KPicListURL @"cars/piclist"



//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//! Network Request URL for Search  Page








//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//! Network Request URL for Tool  Page









//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//! Network Request URL for Sale  Page





//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//! Network Request URL for More  Page


#endif











