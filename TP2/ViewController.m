//
//  ViewController.m
//  TP2
//
//  Created by Valentin Bancarel on 21/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "ViewController.h"
#import "Vehicule.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* myVehicles = [[NSMutableArray alloc]init];
    
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"http://etudiants.openium.fr/lic/mars-2014-partial-small.json"];
    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
    NSMutableDictionary *vehicles = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:NSJSONReadingMutableContainers
                                       error:&error];
    
    if( error ){
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        for ( NSDictionary *vehicle in vehicles ){
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
