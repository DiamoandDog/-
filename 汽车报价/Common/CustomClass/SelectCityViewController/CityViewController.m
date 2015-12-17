//
//  CityViewController.m
//  车蚂蚁1.0
//
//  Created by 崔露凯 on 15/8/1.
//  Copyright (c) 2015年 郑逸凯. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController () {

    UITableView *_tableView;
    
    NSArray *_provinceArray;
    BOOL close[34]; //展开城市列表开关
    UIView *_headView;
}

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _createCancleButton];
    
    //隐藏tabbar
    self.tabBarController.tabBar.hidden = YES;
    
    [self _createTitle:@"选择城市"];
    
    [self _createTableView];
    [self _createHeaderView];
}

//创建标题
- (void)_createTitle:(NSString*)titleName {
    
    UILabel *lable = [[UILabel alloc] init];
    lable.text = titleName;
    lable.textColor = [UIColor whiteColor];
    [lable sizeToFit];
    lable.font = [UIFont boldSystemFontOfSize:20];
    lable.shadowColor = [UIColor blackColor];
    lable.shadowOffset = CGSizeMake(1, 1);
    self.navigationItem.titleView = lable;
    
}



//自定义返回按钮
- (void)_createCancleButton {
    
    //自定义导航栏左边返回按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button sizeToFit];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    
    [button setImage:[UIImage imageNamed:@"button_icon_back"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(cancleAction:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

- (void)cancleAction:(UIButton*)button {
    
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}



   //创建tableView
- (void)_createTableView {

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/250. blue:237/250. alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //读取城市Plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Cities" ofType:@"plist"];
    NSDictionary *provinceDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _provinceArray = provinceDic[@"cities"];
    
    
}

    //创建定位城市，头视图及上面子视图
- (void)_createHeaderView {

    UIView *headBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.size.width, 80)];
    
    //定位标题
    UILabel *labelStatue = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, KScreenWidth - 5, 17)];
    labelStatue.text = @"当前定位城市";
    labelStatue.textColor = [UIColor blueColor];
    labelStatue.font = [UIFont systemFontOfSize:12];
    [headBgView addSubview:labelStatue];
    
    //定位背景
    UIView *viewBG = [[UIView alloc] initWithFrame:CGRectMake(0, 25, KScreenWidth, 30)];
    viewBG.backgroundColor = [UIColor whiteColor];
    [headBgView addSubview:viewBG];
    
    //定位图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 33, 15, 15)];
    imageView.image = [UIImage imageNamed:@"map_coordinate"];
    [headBgView addSubview:imageView];
    
    //定位城市
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(23, 25, KScreenWidth - 23, 30)];
    
    cityLabel.text = @"浙江 杭州";
    cityLabel.font = [UIFont systemFontOfSize:15];
    cityLabel.textColor = [UIColor blueColor];
    [headBgView addSubview:cityLabel];
    
    
    //城市标题
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 58, KScreenWidth - 5, 17)];
    labelTitle.text = @"城市";
    labelTitle.textColor = [UIColor blueColor];
    labelTitle.font = [UIFont systemFontOfSize:12];

    [headBgView addSubview:labelTitle];
    
    _tableView.tableHeaderView = headBgView;
    
}


#pragma mark - tableView delegate 

    //返回tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _provinceArray.count;
}

   //返回tableView每组单元格数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSDictionary *province = _provinceArray[section];
    
    NSArray *array = province[@"cities"];
    if (!close[section]) {
        return 0;
    }
    else {
        return array.count;
    }
}


   //单元格设置内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identify = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        
    }
    
    NSDictionary *province = _provinceArray[indexPath.section];
    NSArray *array = province[@"cities"];
    
    //设置字体颜色
    NSString *text = array[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;

    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                 NSForegroundColorAttributeName:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1]
                                 };
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    //3.设置textView的文本属性
    cell.textLabel.attributedText = attrString;

    return cell;
}


  //选中单元格触发事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.cityBlock) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        self.cityBlock(cell.textLabel.text);
    }
    
    self.tabBarController.tabBar.hidden = NO;

}


   //设置尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

//  //设置组头视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    
    NSDictionary *province = _provinceArray[section];
    
    UIControl* titleView = [[UIControl alloc] initWithFrame:CGRectZero];
    titleView.frame = CGRectMake(0, 0, 100, 44);
    titleView.tag = section;

    
    titleView.backgroundColor = [UIColor whiteColor];
    [titleView addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* textLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, 0, 0)];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text = province[@"province"];
    textLabel.textColor = [UIColor blackColor];
    [textLabel sizeToFit];
    
    //下划线
    UILabel *underLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, KScreenWidth, 2)];
    underLine.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/250. blue:237/250. alpha:1];
    [titleView addSubview:underLine];
    
    [titleView addSubview:textLabel];
    
    return titleView;
}




   //设置组的头视图高度
- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)sectionAction:(UIControl*)control
{
    NSInteger section = control.tag;
    
    //1.切换点击组的状态
    close[section] = !close[section];
    
    //2.刷新tableView
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:section];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}




@end
