//
//  AskTableView.m
//  汽车报价
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "AskTableView.h"

@implementation AskTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initTable];
    }
    return self;
}



- (void)awakeFromNib{
    
    [self _initTable];
    
}

-(void)_initTable
{
    self.delegate = self;
    self.carStyle.text = @"悦动 2015款 1.6L 自动豪华型";
}





#pragma mark - UITableView 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    // 取消单元格选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}




@end
