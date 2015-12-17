//
//  SaleCell.m
//  汽车报价
//
//  Created by imac on 15/9/25.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "SaleCell.h"
#import "UIView+GetViewController.h"
#import "AskTableViewController.h"

@implementation SaleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setCellModel:(SaleModel *)cellModel
{
    if (_cellModel != cellModel) {
        _cellModel = cellModel;
        
        self.specName.text = cellModel.specName;
        self.seriesName.text = cellModel.seriesName;
        self.fctPrice.text = [NSString stringWithFormat:@"%@万",cellModel.fctPrice];
        self.tip.text = cellModel.tip;
        self.dealerPrice.text = [NSString stringWithFormat:@"%@万",cellModel.dealerPrice];
        self.dealerShortName.text = cellModel.dealerShortName;
        
    }
}

- (IBAction)phoneAction:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"400-868-1988" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
    
    [alert show];
}

- (IBAction)askAction:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Ask" bundle:nil];
    AskTableViewController *askVC = (AskTableViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"askTableView"];
    
    // 推进是隐藏标签栏
    askVC.hidesBottomBarWhenPushed = YES;
    [[self getNavigationController] pushViewController:askVC animated:YES];
}
@end
