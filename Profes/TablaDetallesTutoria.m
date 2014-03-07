//
//  TablaDetallesTutoria.m
//  Profes
//
//  Created by Kike Isidoro on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TablaDetallesTutoria.h"
#import <QuartzCore/QuartzCore.h>

@interface TablaDetallesTutoria ()

@end

@implementation TablaDetallesTutoria

@synthesize enviar, titulo, texto, indicator, enviado;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;

    texto.layer.borderWidth = 4.0f;
    texto.layer.borderColor = [[UIColor blackColor] CGColor];
    texto.layer.cornerRadius = 8;
    
    indicator.alpha = 0.0;
    enviado.alpha = 0.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//UITouch *touch = [[event allTouches] anyObject];
    [texto resignFirstResponder];
}

- (IBAction)enviar:(id)sender{
    indicator.alpha = 1.0;
    enviado.alpha = 0.0;
    [indicator startAnimating];
    int valor = (arc4random() % 4) + 1;
    [self performSelector:@selector(emulaIndicador) withObject:nil afterDelay:valor];
}

- (void)emulaIndicador {
    [indicator stopAnimating];
    indicator.alpha = 0.0;
    enviado.alpha = 1.0;
}

@end
