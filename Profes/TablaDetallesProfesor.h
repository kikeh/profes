//
//  TablaDetallesProfesor.h
//  Profes
//
//  Created by Isidoro Bazo on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profesor.h"
#import <MessageUI/MessageUI.h>

@interface TablaDetallesProfesor : UITableViewController

@property (nonatomic, strong) NSMutableArray *listOfItems;
@property (nonatomic, strong) Profesor *profesor;

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
- (void) setProfesor:(Profesor*) profesorData;

@end
