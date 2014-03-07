//
//  Profesor.m
//  Profes
//
//  Created by Kike Isidoro on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Profesores.h"
#import "Profesor.h"
#import "TablaDetallesProfesor.h"


@implementation Profesores

@synthesize profesores;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Establecer fondo de la View
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [tempImageView setFrame:self.tableView.frame]; 

    self.tableView.backgroundView = tempImageView;
    
    //Establece Barra translúcida
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
//    UIImage *topBarBG = [UIImage imageNamed:@"topbar.png"];
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    [topBarBG  drawInRect:CGRectMake(0, 0, navBar.frame.size.width, navBar.frame.size.height)];
//    [navBar setBackgroundImage:topBarBG forBarMetrics:UIBarMetricsDefault];
    
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:topBarBG style:UIBarButtonItemStyleBordered target:nil action:nil];
//    self.navigationItem.backBarButtonItem = btn;
    
    //Inicialización de Profesores
    [self iniciarProfesores];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return profesores.count;
}

// Crea las celdas con los profesores
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[profesores objectAtIndex: indexPath.row] getNombreFormato];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell.png"]];
    [cell setBackgroundView: tempImageView];
    
    return cell;
}

-(IBAction)salir:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// Elige el profesor según la celda y lo manda a través de un segue a la próxima View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"segueTabla" sender:self];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

// Obtiene nombre a partir de un IndexPath
- (NSString*) nombreForIndexPath:(NSIndexPath*) index {
    return [[profesores objectAtIndex: index.row] nombre];
}

// Elige el segue a usarse
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueTabla"])
    {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setProfesor: [profesores objectAtIndex: selectedPath.row]];
        TablaDetallesProfesor *vistaDetalle = [segue destinationViewController];
        vistaDetalle.view.alpha = 1.0; 
    }
}

- (void)iniciarProfesores {
    profe1 = [[Profesor alloc] initWithData:@"Francisco" :@"Serradilla García"];
    profe1.despacho = [NSArray arrayWithObjects: @"4208", nil];
    profe1.email = [NSArray arrayWithObjects: @"fserra@eui.upm.es", nil];
    profe1.asignaturas = [NSArray arrayWithObjects: @"Agentes de Información", @"Sistemas Inteligentes", nil];
    profe1.tutorias = [NSArray arrayWithObjects: @"Lunes: 10:00 - 12:00", @"Miércoles: 10:00 - 12:00", nil];
    profe1.despachoDict = [NSDictionary dictionaryWithObject:[profe1 despacho] forKey:@"Detalles"];
    profe1.emailDict = [NSDictionary dictionaryWithObject:[profe1 email] forKey:@"Detalles"];
    profe1.asignaturasDict = [NSDictionary dictionaryWithObject:[profe1 asignaturas] forKey:@"Detalles"];
    profe1.tutoriasDict = [NSDictionary dictionaryWithObject:[profe1 tutorias] forKey:@"Detalles"];
    [profe1 setLocation:40.389792 :-3.627926];
    
    profe2 = [[Profesor alloc] initWithData:@"Ángel" :@"Arroyo Castillo"];
    profe2.despacho = [NSArray arrayWithObjects: @"4213", nil];
    profe2.email = [NSArray arrayWithObjects: @"aarroyo@eui.upm.es", nil];
    profe2.asignaturas = [NSArray arrayWithObjects: @"Inteligencia Artificial", @"Sistemas Inteligentes", nil];
    profe2.tutorias = [NSArray arrayWithObjects: @"Martes: 13:00 - 14:30", @"Jueves: 11:30 - 14:30", @"Viernes: 13:00 - 14:30", nil];
    profe2.despachoDict = [NSDictionary dictionaryWithObject:[profe2 despacho] forKey:@"Detalles"];
    profe2.emailDict = [NSDictionary dictionaryWithObject:[profe2 email] forKey:@"Detalles"];
    profe2.asignaturasDict = [NSDictionary dictionaryWithObject:[profe2 asignaturas] forKey:@"Detalles"];
    profe2.tutoriasDict = [NSDictionary dictionaryWithObject:[profe2 tutorias] forKey:@"Detalles"];
    [profe2 setLocation:40.389749 :-3.627929];
    
    profe3 = [[Profesor alloc] initWithData:@"Eva" :@"Gil García"];
    profe3.despacho = [NSArray arrayWithObjects: @"4211", nil];
    profe3.email = [NSArray arrayWithObjects: @"evagil@eui.upm.es", nil];
    profe3.asignaturas = [NSArray arrayWithObjects: @"Ingeniería de Rehabilitación", @"Interacción Persona - Máquina", @"Interfaces de Usuario", nil];
    profe3.tutorias = [NSArray arrayWithObjects: @"Miércoles: 11:00 - 15:00", @"Viernes: 10:00 - 11:00", @"Viernes: 13:00 - 14:00", nil];
    profe3.despachoDict = [NSDictionary dictionaryWithObject:[profe3 despacho] forKey:@"Detalles"];
    profe3.emailDict = [NSDictionary dictionaryWithObject:[profe3 email] forKey:@"Detalles"];
    profe3.asignaturasDict = [NSDictionary dictionaryWithObject:[profe3 asignaturas] forKey:@"Detalles"];
    profe3.tutoriasDict = [NSDictionary dictionaryWithObject:[profe3 tutorias] forKey:@"Detalles"];
    [profe3 setLocation:40.389903 :-3.628002];
    
    profe4 = [[Profesor alloc] initWithData:@"Nicolás" :@"Martínez Martínez"];
    profe4.despacho = [NSArray arrayWithObjects: @"4206", nil];
    profe4.email = [NSArray arrayWithObjects: @"nicos@eui.upm.es", nil];
    profe4.asignaturas = [NSArray arrayWithObjects: @"Ingeniería de Rehabilitación", @"Inteligencia Artificial", @"Interfaces de Usuario", nil];
    profe4.tutorias = [NSArray arrayWithObjects: @"Miércoles: 12:00 - 15:00", @"Viernes: 12:00 - 15:00", nil];
    profe4.despachoDict = [NSDictionary dictionaryWithObject:[profe4 despacho] forKey:@"Detalles"];
    profe4.emailDict = [NSDictionary dictionaryWithObject:[profe4 email] forKey:@"Detalles"];
    profe4.asignaturasDict = [NSDictionary dictionaryWithObject:[profe4 asignaturas] forKey:@"Detalles"];
    profe4.tutoriasDict = [NSDictionary dictionaryWithObject:[profe4 tutorias] forKey:@"Detalles"];
    [profe4 setLocation:40.389829 :-3.627999];
    
    profe5 = [[Profesor alloc] initWithData:@"Pedro Pablo" :@"Alarcón Cavero"];
    profe5.despacho = [NSArray arrayWithObjects: @"1120", nil];
    profe5.email = [NSArray arrayWithObjects: @"pcavero@eui.upm.es", nil];
    profe5.asignaturas = [NSArray arrayWithObjects: @"Aplicación de la Gestión de la Información", @"Arquitectura y Desarrollo de Sistemas de Información", nil];
    profe5.tutorias = [NSArray arrayWithObjects: @"Martes: 16:00 - 19:00", @"Miércoles: 12:00 - 14:00", @"Jueves: 12:00 - 13:00", nil];
    profe5.despachoDict = [NSDictionary dictionaryWithObject:[profe5 despacho] forKey:@"Detalles"];
    profe5.emailDict = [NSDictionary dictionaryWithObject:[profe5 email] forKey:@"Detalles"];
    profe5.asignaturasDict = [NSDictionary dictionaryWithObject:[profe5 asignaturas] forKey:@"Detalles"];
    profe5.tutoriasDict = [NSDictionary dictionaryWithObject:[profe5 tutorias] forKey:@"Detalles"];
    [profe5 setLocation:40.388605 :-3.627685];
    
    profe6 = [[Profesor alloc] initWithData:@"Agustín" :@"Yagüe Panadero"];
    profe6.despacho = [NSArray arrayWithObjects: @"1119", nil];
    profe6.email = [NSArray arrayWithObjects: @"ayague@eui.upm.es", nil];
    profe6.asignaturas = [NSArray arrayWithObjects: @"Arquitectura y Diseño Software", @"Gestión de Proyectos y del Riesgo", nil];
    profe6.tutorias = [NSArray arrayWithObjects: @"Martes: 12:00 - 14:00", @"Martes: 15:00 - 16:00", @"Miércoles: 15:00 - 17:00" , @"Jueves: 15:00 - 16:00", nil];
    profe6.despachoDict = [NSDictionary dictionaryWithObject:[profe6 despacho] forKey:@"Detalles"];
    profe6.emailDict = [NSDictionary dictionaryWithObject:[profe6 email] forKey:@"Detalles"];
    profe6.asignaturasDict = [NSDictionary dictionaryWithObject:[profe6 asignaturas] forKey:@"Detalles"];
    profe6.tutoriasDict = [NSDictionary dictionaryWithObject:[profe6 tutorias] forKey:@"Detalles"];
    [profe6 setLocation:40.388605 :-3.627685];
    
    profe7 = [[Profesor alloc] initWithData:@"Jennifer" :@"Pérez Bendí"];
    profe7.despacho = [NSArray arrayWithObjects: @"1203", nil];
    profe7.email = [NSArray arrayWithObjects: @"jperez@eui.upm.es", nil];
    profe7.asignaturas = [NSArray arrayWithObjects: @"Construcción y Evolución del Software", @"Arquitectura y Diseño Software", @"Gestión de Proyectos y del Riesgo", nil];
    profe7.tutorias = [NSArray arrayWithObjects: @"Martes: 16:00 - 17:00", @"Miércoles: 09:00 - 14:00", nil];
    profe7.despachoDict = [NSDictionary dictionaryWithObject:[profe7 despacho] forKey:@"Detalles"];
    profe7.emailDict = [NSDictionary dictionaryWithObject:[profe7 email] forKey:@"Detalles"];
    profe7.asignaturasDict = [NSDictionary dictionaryWithObject:[profe7 asignaturas] forKey:@"Detalles"];
    profe7.tutoriasDict = [NSDictionary dictionaryWithObject:[profe7 tutorias] forKey:@"Detalles"];
    [profe7 setLocation:40.388605 :-3.627685];
    
    profe8 = [[Profesor alloc] initWithData:@"Blanca Mª" :@"Ruiz Palma"];
    profe8.despacho = [NSArray arrayWithObjects: @"2011", nil];
    profe8.email = [NSArray arrayWithObjects: @"blancar@eui.upm.es", nil];
    profe8.asignaturas = [NSArray arrayWithObjects: @"Álgebra", @"Análisis Matemático", @"Estadística", nil];
    profe8.tutorias = [NSArray arrayWithObjects: @"Lunes: 09:00 - 13:00", @"Jueves: 09:00 - 11:00", nil];
    profe8.despachoDict = [NSDictionary dictionaryWithObject:[profe8 despacho] forKey:@"Detalles"];
    profe8.emailDict = [NSDictionary dictionaryWithObject:[profe8 email] forKey:@"Detalles"];
    profe8.asignaturasDict = [NSDictionary dictionaryWithObject:[profe8 asignaturas] forKey:@"Detalles"];
    profe8.tutoriasDict = [NSDictionary dictionaryWithObject:[profe8 tutorias] forKey:@"Detalles"];
    [profe8 setLocation:40.389059 :-3.627841];
    
    profe9 = [[Profesor alloc] initWithData:@"José Ignacio" :@"Gómez Leal"];
    profe9.despacho = [NSArray arrayWithObjects: @"2102", nil];
    profe9.email = [NSArray arrayWithObjects: @"jigomez@eui.upm.es", nil];
    profe9.asignaturas = [NSArray arrayWithObjects: @"Análisis Matemático", @"Estadística", nil];
    profe9.tutorias = [NSArray arrayWithObjects: @"Lunes: 17:00 - 20:00", @"Miércoles: 19:00 - 21:00", @"Jueves: 20:00 - 21:00", nil];
    profe9.despachoDict = [NSDictionary dictionaryWithObject:[profe9 despacho] forKey:@"Detalles"];
    profe9.emailDict = [NSDictionary dictionaryWithObject:[profe9 email] forKey:@"Detalles"];
    profe9.asignaturasDict = [NSDictionary dictionaryWithObject:[profe9 asignaturas] forKey:@"Detalles"];
    profe9.tutoriasDict = [NSDictionary dictionaryWithObject:[profe9 tutorias] forKey:@"Detalles"];
    [profe9 setLocation:40.389059 :-3.627841];
    
    profe10 = [[Profesor alloc] initWithData:@"Mª Ángeles" :@"Martínez Sánchez"];
    profe10.despacho = [NSArray arrayWithObjects: @"2010", nil];
    profe10.email = [NSArray arrayWithObjects: @"ams@eui.upm.es", nil];
    profe10.asignaturas = [NSArray arrayWithObjects: @"Análisis Matemático", @"Matemática Discreta", nil];
    profe10.tutorias = [NSArray arrayWithObjects: @"Lunes: 12:00 - 13:00", @"Martes: 12:00 - 13:00", @"Miércoles: 09:00 - 11:00", @"Miércoles: 12:00 - 14:00", nil];
    profe10.despachoDict = [NSDictionary dictionaryWithObject:[profe10 despacho] forKey:@"Detalles"];
    profe10.emailDict = [NSDictionary dictionaryWithObject:[profe10 email] forKey:@"Detalles"];
    profe10.asignaturasDict = [NSDictionary dictionaryWithObject:[profe10 asignaturas] forKey:@"Detalles"];
    profe10.tutoriasDict = [NSDictionary dictionaryWithObject:[profe10 tutorias] forKey:@"Detalles"];
    [profe10 setLocation:40.389059 :-3.627841];
    
    profesores = [NSArray arrayWithObjects: profe5, profe2, profe3, profe9, profe4, profe10, profe7, profe8, profe1, profe6, nil];
}

@end
