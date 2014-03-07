//
//  DetalleMapa.h
//  Profes
//
//  Created by Kike Isidoro on 29/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DisplayMap.h"

@interface DetalleMapa : UIViewController {
}

@property (nonatomic, strong) IBOutlet UILabel *bloque;
@property (nonatomic, strong) IBOutlet UILabel *planta;
@property (nonatomic, strong) IBOutlet MKMapView *mapa;
@property (nonatomic, strong) DisplayMap *pin;

@property (nonatomic) CLLocationCoordinate2D location;

- (void) ponerPin;

@end
