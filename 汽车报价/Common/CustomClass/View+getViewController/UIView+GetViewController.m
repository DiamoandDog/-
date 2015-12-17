//
//  UIView+GetViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/27.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "UIView+GetViewController.h"

@implementation UIView (GetViewController)

- (UIViewController *)getViewController {
    
    UIResponder *responder = self.nextResponder;

    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
    
    
}



-(UINavigationController *)getNavigationController
{
    UIResponder *responder = self.nextResponder;
    
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController*)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
 
}

@end
