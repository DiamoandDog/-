//
//  PhotoCell.m
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScrollVeiw.h"

@implementation PhotoCell
{
    PhotoScrollVeiw * photoscrollveiw;
}


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建子视图
        [self _createSubViews];
    }
    return self;
    
}

- (void)_createSubViews
{
    photoscrollveiw = [[PhotoScrollVeiw alloc] initWithFrame:self.bounds];
    photoscrollveiw.tag = 2000;
    
    [self.contentView addSubview:photoscrollveiw];

}

-(void)setBigImageURL:(NSString *)bigImageURL
{
    if (_bigImageURL != bigImageURL) {
        
        _bigImageURL = bigImageURL;
    }
    photoscrollveiw.bigImageURL = _bigImageURL;
    photoscrollveiw.largerImageURL = _largeImageURL;

}

-(void)setLargeImageURL:(NSString *)largeImageURL
{
    if (_largeImageURL != largeImageURL) {
        
        _largeImageURL = largeImageURL;
    }
    
    photoscrollveiw.bigImageURL = _bigImageURL;
    photoscrollveiw.largerImageURL = _largeImageURL;

}

@end
