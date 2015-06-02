//
//  Loader.m
//  TP2
//
//  Created by Valentin Bancarel on 28/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "Loader.h"
#import "Vehicule.h"

@interface Loader ()


@property NSTimeInterval downloadingInterval;
@property NSTimeInterval creatingInterval;

@end

//TO-DO:
//    create a didFinishInstancing metho, and separate the DL and creating part of the process
//    use that loader to load and to do that:
//        create an interface "dataHandler" with a method abble to get the vehicles dic, make the MVC implementing it and call the said method in didFinih Downloading
@implementation Loader

-(id)getDictFromJSONUrl:(NSString *)urlString{
    
    
    NSURL *url = [NSURL URLWithString:@"http://etudiants.openium.fr/lic/mars-2014-partial.json"];
    
    NSDate* startDate = [NSDate date];
    
    [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self didFinishDownloading:data startDate:startDate error:error];
        });
        
    }];
    [downloadTask resume];
    
    
    
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
    if( error ){
        NSLog(@"%@", [error description]);
        return nil;
    }
    
    NSMutableDictionary *dict = [NSJSONSerialization
                                     JSONObjectWithData:data
                                     options:NSJSONReadingMutableContainers
                                     error:&error];
    if( error ){
        NSLog(@"%@", [error description]);
        return nil;
    }
    return dict;
}

- (void)didFinishDownloading:(NSData*)jsonData startDate:(NSDate*) startDate error:(NSError*) downloadError{
    
    NSError *serializationError = nil;
    NSMutableArray* voituresTelechargees = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&serializationError];
    
    NSDate* endDate = [NSDate date];
    NSTimeInterval downloadingIntervale = [endDate timeIntervalSinceDate:startDate];
    
    //Creating Vehicles
    startDate = [NSDate date];
    
    NSMutableArray* vehicles = [[NSMutableArray alloc] init];
    for (NSMutableDictionary* voiture in voituresTelechargees) {
        Vehicule* tmp = [[Vehicule alloc] initFromDictionnary:voiture];
        [vehicles addObject:tmp];
    }
    
}
@end
