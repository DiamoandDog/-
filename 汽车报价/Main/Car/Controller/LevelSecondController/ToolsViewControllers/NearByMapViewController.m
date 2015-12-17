//
//  NearByMapViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NearByMapViewController.h"

@interface NearByMapViewController ()

@end

@implementation NearByMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    
    _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _locationManager.delegate = self;
    
    if (ios8) {
        
        [_locationManager requestWhenInUseAuthorization];
        
    }
    
    [_locationManager startUpdatingLocation];
    
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.showsUserLocation = YES;
    
    _mapView.mapType = MKMapTypeHybrid;
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];

}

#pragma mark -
#pragma mark Hidden tableBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}



#pragma mark -
#pragma mark CLLocationManager Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//    
//}

@end
