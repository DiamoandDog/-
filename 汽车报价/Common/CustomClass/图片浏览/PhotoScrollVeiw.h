//
//  PhotoScrollVeiw.h
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollVeiw : UIScrollView<UIScrollViewDelegate>


@property (nonatomic, copy) NSString *bigImageURL;
@property (nonatomic, copy) NSString *largerImageURL;


@end
