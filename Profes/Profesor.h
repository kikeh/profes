//
//  Profesor.h
//  Profes
//
//  Created by Isidoro Bazo on 17/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Profesor : NSObject

@property (nonatomic, strong) NSArray *despacho;
@property (nonatomic, strong) NSArray *email;
@property (nonatomic, strong) NSArray *asignaturas;
@property (nonatomic, strong) NSArray *tutorias;

@property (nonatomic, strong) NSDictionary *despachoDict;
@property (nonatomic, strong) NSDictionary *emailDict;
@property (nonatomic, strong) NSDictionary *asignaturasDict;
@property (nonatomic, strong) NSDictionary *tutoriasDict;

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *apellidos;
@property (nonatomic, strong) NSString *nombreFormato;

@property (nonatomic) CLLocationCoordinate2D location;

- (Profesor*) initWithData: (NSString*) nombre: (NSString*) apellidos;
- (void) setLocation:(CLLocationDegrees) latitude:(CLLocationDegrees) longitude;
- (NSString*) getNombreFormato;

@end
