//
//  MoreTableViewController.m
//  汽车报价
//
//  Created by 谷泓毅 on 15/9/28.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "MoreTableViewController.h"
#import "SuggestionViewController.h"
#import "CityTableViewController.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                NSFontAttributeName:[UIFont
                                                   systemFontOfSize:19],
                                     NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 18;
    self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
}

- (long long)countFileSize {
    // /Library/Caches/com.hackemist.SDWebImageCache.default SDWebImage框架的缓存文件夹
    // /Library/Caches/com.2.---- 系统框架的缓存文件夹 WebView
    // 获取当前应用程序的沙盒路径
    NSString *homePath = NSHomeDirectory();
    NSArray *subFilePath = @[@"/Library/Caches/*******", @"/Library/Caches/com.hackemist.SDWebImageCache.default/"];
    long long fileSize = 0;
    for (NSString *filePath in subFilePath) {
        // 获取SDWebImage的缓存文件夹路径
        NSString *subFile = [homePath stringByAppendingPathComponent:filePath];
        // 创建一个文件管理器  单例
        NSFileManager *fileManager = [NSFileManager defaultManager]; // 文件管理器
        
        // 获取某个路径下所有文件的文件名
        NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:subFile error:nil];
        // 遍历文件夹
        for (NSString *fileName in fileNames) {
            // 拼接文件路径
            NSString *file = [subFile stringByAppendingPathComponent:fileName];
            // 根据文件路径 获取文件的相关信息
            NSDictionary *dic =[fileManager attributesOfItemAtPath:file error:nil];
            fileSize += [dic[NSFileSize] longLongValue];
        }
    }
    _CacheLabel.text = [NSString stringWithFormat:@"%.2fMB", (CGFloat)fileSize / 1024 / 1024];
    return fileSize;
}

// 当视图将要显示的时候 计算缓存文件大小
- (void)viewWillAppear:(BOOL)animated {
    [self countFileSize];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"More"
                                                                 bundle:nil];
            CityTableViewController *cityViewController = [storyboard instantiateViewControllerWithIdentifier:@"CityStoryboard"];
            cityViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cityViewController animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SuggestionViewController *write = [[SuggestionViewController alloc] init];
            UIApplication *app = [UIApplication sharedApplication];
            [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
             write.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:write animated:YES];
        }
        else if (indexPath.row == 1) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示"
                                                               message:@"是否清理缓存"
                                                              delegate:self
                                                     cancelButtonTitle:@"取消"
                                                     otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //确定按钮被点击
    if (buttonIndex == 1) {
        // 内存清理
        NSString *homePath = NSHomeDirectory();
        NSArray *subFilePath = @[@"/Library/Caches/com.2.----", @"/Library/Caches/com.hackemist.SDWebImageCache.default/"];
        for (NSString *filePath in subFilePath) {
            // 获取SDWebImage的缓存文件夹路径
            NSString *subFile = [homePath stringByAppendingPathComponent:filePath];
            // 创建一个文件管理器
            NSFileManager *fileManager = [NSFileManager defaultManager]; // 文件管理器
            // 获取某个路径下所有文件的文件名
            NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:subFile error:nil];
            // 遍历文件夹
            for (NSString *fileName in fileNames) {
                // 拼接文件路径
                NSString *file = [subFile stringByAppendingPathComponent:fileName];
                // 删除文件路径
                [fileManager removeItemAtPath:file error:nil];
            }
        }
        _CacheLabel.text = @"清理中...";
        // 删除文件之后，再次计算程序缓存文件大小
        [self performSelector:@selector(countFileSize) withObject:nil afterDelay:0.2];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UIScrollView Delegete
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    
    if (yOffset < -10) {
        scrollView.contentOffset = CGPointMake(0, -10);
        
    }
    // NSLog(@"%f",yOffset);//test😊😊😊😊😊test😊😊😊😊😊test
    
}

@end
