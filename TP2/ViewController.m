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
    NSMutableDictionary *vehiclesDict = [[Loader alloc]getDictFromJSONUrl:@"http://etudiants.openium.fr/lic/mars-2014-partial-small.json"];
    
        
    if (vehiclesDict) {
        for ( NSDictionary *vehicle in vehiclesDict ){
            Vehicule *v = [[Vehicule alloc] initFromDictionnary:vehicle];
            [myVehicles addObject:v];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
