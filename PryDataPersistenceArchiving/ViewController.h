//
//  ViewController.h
//  PryDataPersistenceArchiving
//
//  Created by Henry AT on 5/8/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtData;
@property (strong, nonatomic) NSString * dataFieldPath;

- (IBAction)guardarDatos:(id)sender;

@end

