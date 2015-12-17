//
//  NearByMapViewController.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class MKMapView;


@interface NearByMapViewController : BaseViewController<CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
}

@end
