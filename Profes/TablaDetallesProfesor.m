//
//  TablaDetallesProfesor.m
//  Profes
//
//  Created by Isidoro Bazo on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TablaDetallesProfesor.h"
#import "Profesor.h"
#import "DetalleMapa.h"
#import "TablaDetallesTutoria.h"


@implementation TablaDetallesProfesor

@synthesize profesor;
@synthesize listOfItems;

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
    
    // Establece opciones de fondo y colores
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    self.tableView.backgroundView = tempImageView; 
    
    // Inicializa las celdas agrupadas según el Profesor elegido
    listOfItems = [[NSMutableArray alloc] init];
    
    [listOfItems addObject:profesor.despachoDict];
    [listOfItems addObject:profesor.emailDict];
    [listOfItems addObject:profesor.asignaturasDict];
    [listOfItems addObject:profesor.tutoriasDict];
    
    self.navigationItem.title = @"Detalles";

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

// Número de secciones en la tabla
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [listOfItems count];
}

// Número de filas en cada sección
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [listOfItems objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"Detalles"];
    return [array count];
}

// Cambia opciones de tabla
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 320.0, 22.0)];
    //customView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"headerbackground.png"]];;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    headerLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    headerLabel.frame = CGRectMake(11,-11, 320.0, 44.0);
    [customView addSubview:headerLabel];
    return customView;
}

// Crea las celdas según la información del Profesor
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    
    //First get the dictionary object
    NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"Detalles"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.text = cellValue;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if(indexPath.section == 0 || indexPath.section == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    UIImage* img = [ UIImage imageNamed: @"cell.png"];
    cell.backgroundColor = [UIColor colorWithPatternImage:img];
    
    return cell;

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

// Elige el detalle según la celda y lo manda a través de un segue a la próxima View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"segueMap" sender:self];
    }
    else if (indexPath.section == 1) {
        if ([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            
            mailer.mailComposeDelegate = self;
            
            NSArray *toRecipients = [NSArray arrayWithObjects:[profesor.email objectAtIndex:0], nil];
            [mailer setToRecipients:toRecipients];
            
            [self presentModalViewController:mailer animated:YES];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"Your device doesn't support the composer sheet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
    else if (indexPath.section == 3) {
        [self performSegueWithIdentifier:@"segueTutoria" sender:self];
    }
}

// Cierra correctamente la subview de Mail.app
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}

// Elige el segue a usarse
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueMap"])
    {
        //NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setLocation: profesor.location];
        DisplayMap *dm = [[DisplayMap alloc] init];
        dm.title = profesor.nombre;
        dm.subtitle = [profesor.despacho objectAtIndex:0];
        DetalleMapa *viewMapa = [segue destinationViewController];
        viewMapa.view.alpha = 1.0;
        viewMapa.pin = dm;
        [viewMapa ponerPin];
        NSString *bloqueProfe = [NSString stringWithFormat: @"%C", [[profesor.despacho objectAtIndex:0] characterAtIndex:0]];
        NSString *plantaProfe = [NSString stringWithFormat: @"%C", [[profesor.despacho objectAtIndex:0] characterAtIndex:1]];
        viewMapa.bloque.text = bloqueProfe;
        viewMapa.planta.text = plantaProfe;
    }
    else if ([[segue identifier] isEqualToString:@"segueTutoria"])
    {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        TablaDetallesTutoria *tutoria = [segue destinationViewController];
        tutoria.view.alpha = 1.0;
        tutoria.titulo.textColor = [UIColor whiteColor];
        NSString *fechaTutoria = [profesor.tutorias objectAtIndex: selectedPath.row];
        tutoria.titulo.text = fechaTutoria;
        
        tutoria.texto.text =[NSString stringWithFormat: @"Hola %@, me gustaría reservar una tutoría para el próximo %@. El motivo por el que la solicito es: ", profesor.nombre, fechaTutoria];
    }
}

// Establece el nombre de cada grupo de celdas
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Despacho";
    else if(section == 1)
        return @"Email";
    else if(section == 2)
        return @"Asignaturas";
    else
        return @"Tutorías";
}

- (void) setProfesor:(Profesor*) profesorData {
    profesor = profesorData;
}

@end
