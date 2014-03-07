//
//  Profesor.m
//  Profes
//
//  Created by Isidoro Bazo on 17/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Profesor.h"

@implementation Profesor

@synthesize despacho;
@synthesize email;
@synthesize asignaturas;
@synthesize tutorias;

@synthesize despachoDict;
@synthesize emailDict;
@synthesize asignaturasDict;
@synthesize tutoriasDict;

@synthesize nombre;
@synthesize apellidos;
@synthesize nombreFormato;

@synthesize location;

//Constructor de Profesor con Nombre y Apellidos
- (Profesor*) initWithData:(NSString *) initNombre :(NSString *) initApellidos {
    self = [super init];
    
    if (self) {
        [self setNombre: initNombre];
        [self setApellidos: initApellidos];
    }
    
    return self;
}

// Asigna una situación en un mapa (Location) a un profesor
- (void) setLocation:(CLLocationDegrees) latitude:(CLLocationDegrees) longitude {
    location = CLLocationCoordinate2DMake(latitude, longitude);
}

// Devuelve el nombre formateado (Apellidos, Nombre)
- (NSString*) getNombreFormato {
    return [NSString stringWithFormat:@"%@, %@", apellidos, nombre];
}

@end
