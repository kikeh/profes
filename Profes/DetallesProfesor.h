//
//  DetallesProfesor.h
//  Profes
//
//  Created by Kike Isidoro on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetallesProfesor : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *nombre;
@property (nonatomic, strong) IBOutlet UITextField *despacho;
@property (nonatomic, strong) IBOutlet UILabel *nombreLabel;
@property (nonatomic, strong) IBOutlet UILabel *despachoLabel;
@property (nonatomic, strong) NSArray *detallesProfesores;

-(void)setNombreText:(NSString*) nombre;
-(void)setDespachoText:(NSString*) despacho;

@end
