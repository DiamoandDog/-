//
//  SuggestionViewController.m
//  汽车报价
//
//  Created by 谷泓毅 on 15/9/28.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SuggestionViewController.h"

@interface SuggestionViewController ()

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"意见反馈";
//    CGRect rect = [[UIScreen mainScreen] bounds];
////    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_mainWrite"]];
//    UITextView *mainWrite = [[UITextView alloc] initWithFrame:CGRectMake(10, 50, rect.size.width - 20, 120)];
//    mainWrite.textColor = [UIColor whiteColor];
//    mainWrite.font = [UIFont boldSystemFontOfSize:15];
//    [self.view addSubview:mainWrite];
//    
//    UIButton *buttonSend = [UIButton buttonWithType:UIButtonTypeCustom];
//    buttonSend.frame = CGRectMake(10, 210, 85, 30);
//    
//    [buttonSend setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
//    [buttonSend setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateHighlighted];
//    
//    UILabel *titleSend = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 45, 30)];
//    titleSend.textColor = [UIColor whiteColor];
//    titleSend.textAlignment = NSTextAlignmentCenter;
//    titleSend.font = [UIFont boldSystemFontOfSize:18];
//    titleSend.text = @"发送";
//    [buttonSend addSubview:titleSend];
//    [self.view addSubview:buttonSend];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
