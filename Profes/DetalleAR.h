//
//  DetalleAR.h
//  Profes
//
//  Created by Marini on 30/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface DetalleAR : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *imageView;
    BOOL newMedia;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)useCamera:(id)sender;

@end
