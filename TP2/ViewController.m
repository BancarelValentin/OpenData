//
//  ViewController.m
//  TP2
//
//  Created by Valentin Bancarel on 21/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "ViewController.h"
#import "Vehicule.h"

#import "Loader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* myVehicles = [[NSMutableArray alloc]init];
    NSMutableDictionary *vehiclesDict = [[Loader alloc]getDictFromJSONUrl:@"http://etudiants.openium.fr/lic/mars-2014-partial.json"];
    
        
    if (vehiclesDict) {
        for ( NSDictionary *vehicle in vehiclesDict ){
            Vehicule *v = [[Vehicule alloc] initFromDictionnary:vehicle];
            [myVehicles addObject:v];
        }
    }else{
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"No WIFI" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
