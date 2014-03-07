//
//  Profesor.h
//  Profes
//
//  Created by Kike Isidoro on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profesor.h"

@interface Profesores : UITableViewController {
    Profesor *profe1;
    Profesor *profe2;
    Profesor *profe3;
    Profesor *profe4;
    Profesor *profe5;
    Profesor *profe6;
    Profesor *profe7;
    Profesor *profe8;
    Profesor *profe9;
    Profesor *profe10;
}

@property (nonatomic, strong) NSArray *profesores;

- (NSString*) nombreForIndexPath:(NSIndexPath*) index;
- (NSString*) despachoForIndexPath:(NSIndexPath*) index;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (void)iniciarProfesores;

@end
