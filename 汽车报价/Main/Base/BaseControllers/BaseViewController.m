//
//  BaseViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomButton.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()
{
    UILabel *_titleLable; //The navigationBar titile
    
    MBProgressHUD *_tipView; //The TipView for loading data
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    // Custom NavigationBar's properties
    [self customNavigationBarWithTitle:YES];
    
    
    

}



#pragma mark -
#pragma mark Custom navigationItem.titleView and backBarButtonItem
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)customNavigationBarWithTitle:(BOOL)isBackBtn
{
    //|-----------------------------------------------------------------------------------
    //!Custom navigationBar titel

    if (isBackBtn) {
        
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, KNavigationBarHeight)];
        
        
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        
        _titleLable.font = [UIFont boldSystemFontOfSize:16];
        
        //default is CGSizeMake(0, -1) -- a top shadow
        _titleLable.shadowOffset = CGSizeMake(0, -1.5);
        _titleLable.shadowColor = [UIColor grayColor];
        
        self.navigationItem.titleView = _titleLable;
        
        //|-----------------------------------------------------------------------------------
        //!Custom navigationBar backButtonItem
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        backBtn.frame = CGRectMake(0, 0, 40, 40);
        [backBtn setImage:[UIImage imageNamed:@"back_b@2x"] forState:UIControlStateNormal];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        self.navigationItem.leftBarButtonItem = backItem;
    }else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }

}





- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _titleLable.text = title;
    
}


- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Create TipView for loading data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)showLoadingView
{
    _tipView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _tipView.labelFont = [UIFont boldSystemFontOfSize:16];
    _tipView.labelText = @"正在加载";
}

-(void)showLoadingOverTimeView
{
    _tipView.labelText = @"请求超时";
    _tipView.mode = MBProgressHUDModeCustomView;
    [_tipView hide:YES afterDelay:1.5];

}

-(void)showLoadingSuccessfulView
{
    [_tipView hide:YES];
}

@end
