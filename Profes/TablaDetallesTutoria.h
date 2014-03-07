//
//  TablaDetallesTutoria.h
//  Profes
//
//  Created by Kike Isidoro on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TablaDetallesTutoria : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *titulo;
@property (nonatomic, strong) IBOutlet UIButton *enviar;
@property (nonatomic, strong) IBOutlet UITextView *texto;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, strong) IBOutlet UILabel *enviado;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)enviar:(id)sender;

@end
