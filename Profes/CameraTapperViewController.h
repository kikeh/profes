//
//  CameraTapperViewController.h
//  Profes
//
//  Created by Marini on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraTapperViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImageView *myImageView;
    UIImage *myImage;
}

@end
