//
//  CameraTapperViewController.m
//  Profes
//
//  Created by Marini on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraTapperViewController.h"
#import "CustomCamera.h"

@implementation CameraTapperViewController

- (void) launchCamera {
    
    // Set up the camera
    CustomCamera *cameraController = [[CustomCamera alloc] init];
    cameraController.sourceType =
    UIImagePickerControllerSourceTypeCamera;
    cameraController.delegate = self;
    
    cameraController.showsCameraControls = NO;
    cameraController.navigationBarHidden = YES;
    cameraController.toolbarHidden = YES;
    
    // overlay on top of camera lens view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self 
               action:@selector(volverAtras)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Volver" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    button.center = CGPointMake(160.0, 450.0);
    
    cameraController.cameraOverlayView = button;
    
    // animate the fade in after the shutter opens
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDelay:2.2f];
//    cameraOverlayView.alpha = 1.0f;
//    [UIView commitAnimations];
    
    [self presentModalViewController:cameraController animated:YES];
}

-(void)volverAtras {
    [self dismissModalViewControllerAnimated:YES];    
}

// User took an image
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)inImage
                  editingInfo:(NSDictionary *)editingInfo {
    myImage = inImage;
    myImageView.image = myImage;
    
    // Get rid of the picker interface
    [[picker parentViewController]
     dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    
    // display the background image view
    myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:myImageView];
    
    // display the button to launch the camera
    UIButton *btnLaunchCamera = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnLaunchCamera.frame = CGRectMake(60, 220, 200, 40);
    [btnLaunchCamera setTitle:@"Start" forState:UIControlStateNormal];
    [btnLaunchCamera addTarget:self action:@selector(launchCamera) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnLaunchCamera];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

@end
