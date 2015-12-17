//
//  CitySelectedViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/7.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CitySelectedViewController.h"
#import "CityCell.h"

@interface CitySelectedViewController ()

@end

static NSString *cityCellIdentify = @"CityCell";

@implementation CitySelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self _createViews];

}

- (void)_createViews
{
    //|-----------------------------------------------------------------------------------
    //!HeaderView for TipView
    UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    
    tipView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    //tipView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:tipView];
    
    //TipImageView
    UIImageView *tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MessageSendFail"]];
    
    tipImageView.frame = CGRectMake(0, 5, 30, 25);
    
    tipImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [tipView addSubview:tipImageView];

    
    //TipLable
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, KScreenWidth - 40, 40)];
    
    tipLabel.textColor = [UIColor grayColor];
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.numberOfLines = 0;
    tipLabel.text = @"选择城市后，会为你推送该城市的降价信息，但是选择省份及全国时，不会为你推送";

    [tipView addSubview:tipLabel];
    
    
    //|-----------------------------------------------------------------------------------
    //!Selected City TableView
    UITableView *cityTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    
    cityTableView.backgroundColor = [UIColor grayColor];
    cityTableView.dataSource = self;
    cityTableView.delegate = self;
    
    UINib *cityNib = [UINib nibWithNibName:@"CityCell" bundle:[NSBundle mainBundle]];
    
    [cityTableView registerNib:cityNib forCellReuseIdentifier:cityCellIdentify];
    
    [self.view addSubview:cityTableView];
    
    

    
    
    
}


#pragma mark -
#pragma mark CityTableVIew DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CityCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCellIdentify forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark -
#pragma mark CityTableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

















































#pragma mark -
#pragma mark Hidden tableBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}



@end
