//
//  PhotoScrollVeiw.m
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "PhotoScrollVeiw.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollVeiw
{
    UIImageView *imageView;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.delegate = self;
        self.maximumZoomScale = 5.0;
        self.minimumZoomScale = 0.2;
        
        

        [self _createSubViews];
    }
    
    return self;
}


- (void)_createSubViews
{
    imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:imageView];

    
    //| ----------------------------------------------------------------------------------
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction)];
    
    
    [self addGestureRecognizer:singleTap];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction)];
    
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    
    [self addGestureRecognizer:doubleTap];
    
    // 双击手势时，让单击手势暂时失效
    [singleTap requireGestureRecognizerToFail:doubleTap];

}


- (void)singleTapAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KHiddenNaVigationBarNOtificationName object:nil];
}

- (void)doubleTapAction
{
    if (self.zoomScale != 1) {
        
        [self setZoomScale:1 animated:YES];
    }else{
        
        [self setZoomScale:3 animated:YES];

        
    }

}


- (void)setBigImageURL:(NSString *)bigImageURL
{
    if (_bigImageURL != bigImageURL) {
        
        _bigImageURL = bigImageURL;
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:_bigImageURL]];

    }
    
}

-(void)setLargerImageURL:(NSString *)largerImageURL
{
    if (_largerImageURL != largerImageURL) {
        
        _largerImageURL = largerImageURL;
        
        //[imageView sd_setImageWithURL:[NSURL URLWithString:largerImageURL]];
    }
}

#pragma mark -
#pragma mark UIScrollViewDelegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    
    return imageView;
    
}

@end
