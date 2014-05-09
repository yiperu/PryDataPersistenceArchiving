//
//  ViewController.m
//  PryDataPersistenceArchiving
//
//  Created by Henry AT on 5/8/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFileManager *filemgr;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];

    // Build the path to the data file
    _dataFieldPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"data.archive"]];
    
    // Check if the file already exists
    if ([filemgr fileExistsAtPath: _dataFieldPath])
    {
        NSMutableArray *dataArray;
        
        dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile: _dataFieldPath];
        
        _txtName.text = dataArray[0];
        _txtAddress.text = dataArray[1];
        _txtData.text = dataArray[2];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardarDatos:(id)sender {
    
    NSMutableArray *contactArray;
    
    contactArray = [[NSMutableArray alloc] init];
    [contactArray addObject:_txtName.text];
    [contactArray addObject:_txtAddress.text];
    [contactArray addObject:_txtData.text];
    [NSKeyedArchiver archiveRootObject: contactArray toFile:_dataFieldPath];
    
}
@end
