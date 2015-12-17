//
//  SearchTableView.m
//  汽车报价
//
//  Created by mac on 15/9/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SearchTableView.h"
#import "DataService.h"

@implementation SearchTableView
{
    UIButton *pauseButton;//用来保存级别上一次点击的按钮
    UIButton *contryPauseButton;//保存国别上一次点击的按钮
    UIButton *attrPauseButton;
    UIButton *deployPauseButton;
    NSMutableDictionary *params;//网络请求参数
    NSString *_session;
    NSInteger count;
    NSMutableString *configStr;//网络请求中的配置参数
    //NSInteger lastConfigIndex;//保存配置按钮最后一次被点击时的参数值
    NSInteger configCount;//配置选项选择的个数
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initTableView];
        params = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)_initTableView {
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
}

#pragma mark - 表视图数据源和代理方法
//每一组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
//表视图中组的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
//组头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1;
}
//自定义组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
    //view.backgroundColor = [UIColor lightGrayColor];
    NSArray *array = @[@"级别",@"国别",@"驱动",@"配置"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, KScreenWidth, 20)];
    label.text = array[section];
    [view addSubview:label];
    
    return view;
}
//自定义单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    //按钮点选中状态下的背景图片
    UIImage *image = [UIImage imageNamed:@"anniu"];
    image = [image stretchableImageWithLeftCapWidth:5 topCapHeight:10];
    //按钮的宽度
    CGFloat weight = (KScreenWidth - 50) / 4;
    if (indexPath.section == 0) {
        //计算每张图片的宽度
        CGFloat weight = (KScreenWidth - 120) / 3;
        //普通状态下图片数组
        NSArray *normalArray = @[@"mini_icon",@"small_icon",@"compact_icon",@"medium_icon",@"middle_icon",@"luxury_icon",@"suv_icon",@"mpv_icon",@"sportscar_icon",@"pickuptruck_icon",@"minibus_icon",@"qk_icon"];
        //选择状态下图片数组
        NSArray *selectedArray = @[@"mini_icon_b",@"small_icon_b",@"compact_icon_b",@"medium_icon_b",@"middle_icon_b",@"luxury_icon_b",@"suv_icon_b",@"mpv_icon_b",@"sportscar_icon_b",@"pickuptruck_icon_b",@"minibus_icon_b",@"qk_icon_b"];
        //labeltextArray
        NSArray *labeltextArray = @[@"微型车",@"小型车",@"紧凑型车",@"中型车",@"中大型车",@"大型车",@"SUV",@"MPV",@"跑车",@"皮卡",@"微面",@"轻客"];
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(30 + (weight + 30) * j, 10 + (30 + 20) * i, weight, 30);
                NSString *normalName = normalArray[3 * i + j];
                NSString *selectedName = selectedArray[3 * i + j];
                [button setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
                [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                button.tag = 4 * i + j;
                [cell.contentView addSubview:button];
                
                UILabel *label = [[UILabel alloc] init];
                label.frame = CGRectMake(30 + (weight + 30) * j, 40 + 50 * i, weight, 10);
                NSString *labelText = labeltextArray[3 * i + j];
                label.text = labelText;
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:10];
                [cell.contentView addSubview:label];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    //国别选择单元格
    if (indexPath.section == 1) {
        //按钮的宽
        CGFloat weight = (KScreenWidth - 50) / 4;
        //按钮标题的数组
        NSArray *titleArray = @[@"中国",@"德国",@"日本",@"美国",@"韩国",@"法国",@"英国",@"意大利",@"瑞典",@"荷兰",@"捷克",@"西班牙"];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(10 + (weight + 10) * j, 10 + 40 * i, weight, 30);
                [button setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1.0]];
                [button setBackgroundImage:image forState:UIControlStateSelected];
                [button setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
                
                NSString *buttonTitle = titleArray[4 * i + j];
                [button setTitle:buttonTitle forState:UIControlStateNormal];
                
                [button setTitleEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
                
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(contryAction:) forControlEvents:UIControlEventTouchUpInside];
                button.tag = 4 * i + j;
                [cell.contentView addSubview:button];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 2) {
        NSArray *array = @[@"前驱",@"后驱",@"四驱"];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10 + (weight + 10) * i, 10, weight, 30);
            button.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1.0];
            [button setBackgroundImage:image forState:UIControlStateSelected];
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(attrAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [cell.contentView addSubview:button];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 3) {
        //labeltext数组
        NSArray *array = @[@"天窗",@"电动调节座椅",@"ESP",@"氙气大灯",@"GPS导航",@"定速巡航",@"真皮坐椅",@"倒车雷达",@"全自动空调",@"多功能方向盘"];
        //label的宽度
        CGFloat weight = (KScreenWidth - 40 - 48) / 2;
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 2; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundImage:[UIImage imageNamed:@"com_selected"] forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:@"com_selected_s"] forState:UIControlStateSelected];
                button.frame = CGRectMake(20 + (weight + 24) * j, 10 + (24 +10) * i, 24, 24);
                [button addTarget:self action:@selector(deployAction:) forControlEvents:UIControlEventTouchUpInside];
                button.tag = 2 * i + j;
                [cell.contentView addSubview:button];
                
                UILabel *label = [[UILabel  alloc] init];
                label.frame = CGRectMake(44 + (weight + 24) * j, 10 + 34 * i, weight, 24);
                label.textColor = [UIColor blackColor];
                label.text = array[2 * i + j];
                [cell.contentView addSubview:label];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 210;
    } else if (indexPath.section == 1) {
        return 130;
    } else if (indexPath.section == 3) {
        return 225 ;
    }
    return 50;
}

//级别按钮点击事件
- (void)buttonAction:(UIButton *)button {
    if (pauseButton != nil && pauseButton != button) {
        pauseButton.selected = NO;
    }

    button.selected = !button.selected;
    pauseButton = button;
    NSInteger index = button.tag + 1;
    NSNumber *number = [NSNumber numberWithInteger:index];

    if (button.selected) {
        [params setValue:number forKey:@"levelid"];
    } else {
        [params setValue:@0 forKey:@"levelid"];
    }
    [self _loadCarCount];
}
//国别按钮点击事件
- (void)contryAction:(UIButton *)button {
    if (contryPauseButton != nil && contryPauseButton != button) {
        contryPauseButton.selected = NO;
    }
    
    button.selected = !button.selected;
    contryPauseButton = button;
    NSInteger index = button.tag + 1;
    NSNumber *number = [NSNumber numberWithInteger:index];
    
    if (button.selected) {
        [params setValue:number forKey:@"countryid"];
    } else {
        [params setValue:@0 forKey:@"countryid"];
    }
    [self _loadCarCount];
}
//属性按钮点击事件
- (void)attrAction:(UIButton *)button {
    if (attrPauseButton != nil && attrPauseButton != button) {
        attrPauseButton.selected = NO;
    }
    
    button.selected = !button.selected;
    attrPauseButton = button;
    NSInteger index = button.tag + 1;
    NSNumber *number = [NSNumber numberWithInteger:index];
    
    if (button.selected) {
        [params setValue:number forKey:@"drivetype"];
    } else {
        [params setValue:@0 forKey:@"drivetype"];
    }
    [self _loadCarCount];
}
//配置按钮点击事件
- (void)deployAction:(UIButton *)button {
    
    button.selected = !button.selected;
    NSInteger index = button.tag + 1;
    if (button.selected) {
        if (configStr == nil) {
            configStr = [[NSMutableString alloc] init];
            configStr = [NSMutableString stringWithFormat:@"%li",index];
        } else {
            [configStr appendFormat:@"_%li",index];
        }
        configCount += 1;
    }
    //取消选择
//    else {
//        if (lastConfigIndex == index) {
//            if (configCount == 1) {
//                NSString *str = [NSString stringWithFormat:@"%li",index];
//                NSRange range = [configStr rangeOfString:str];
//                if (range.location != NSNotFound) {
//                    [configStr deleteCharactersInRange:range];
//                }
//                //configStr = [NSMutableString stringWithFormat:@"0"];
//                //lastConfigIndex = lastConfigIndex - 1;
//            } else if (configCount > 1) {
//                NSString *str = [NSString stringWithFormat:@"_%li",index];
//                NSRange range = [configStr rangeOfString:str];
//                
//                [configStr deleteCharactersInRange:range];
//
//            }
//            //lastConfigIndex = lastConfigIndex - 1;
//        }
//        else {
//            NSString *str = [NSString stringWithFormat:@"%li_",index];
//            NSRange range = [configStr rangeOfString:str];
//            if (range.location != NSNotFound) {
//                [configStr deleteCharactersInRange:range];
//            }
//        }
//        configCount--;
//    }
    else {
        NSString *str = [NSString stringWithFormat:@"%li_",index];
        NSRange range = [configStr rangeOfString:str];
        if (range.location != NSNotFound) {
            [configStr deleteCharactersInRange:range];
            
        } else {
            NSString *str1 = [NSString stringWithFormat:@"%li",index];
            NSRange range = [configStr rangeOfString:str1];
            [configStr deleteCharactersInRange:range];
        }
        configCount -= 1;
        if (configCount == 0) {
            configStr = nil;
        }
    }
    [params setValue:configStr forKey:@"configid"];
    [self _loadCarCount];
}

//筛选汽车数量的网络请求
- (void)_loadCarCount {
    
    NSString *urlString = @"findcaradvance/search";
    [DataService requestAFUrl:urlString httpMethod:@"GET" params:params data:nil block:^(id result) {
        //NSLog(@"%@",result);
        NSDictionary *resultDic = [result valueForKeyPath:@"result"];
        _session = resultDic[@"session"];
        //NSLog(@"%@",_session);
        NSNumber *number = [resultDic valueForKeyPath:@"rowcount"];
        count = [number integerValue];
        if (_block) {
            _block(_session,count);
        }
    }];
    
}

@end
