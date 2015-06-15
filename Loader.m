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

@end
@implementation Loader

-(void)downloadFile:(NSURL*)url for:(id)delegate{
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
 
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:delegate delegateQueue:nil];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url];
    
    [downloadTask resume];
}

-(void)instanciateVehiclesFromJSON:(NSURL *)url andGiveThemTo:(id)delegate{

    NSDate *startingDate = [NSDate date];
    NSData *JSONData = [NSData dataWithContentsOfFile:[url absoluteString]];
    NSError *serializationError;

        NSMutableArray* vehiclesJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&serializationError];
        NSMutableArray* vehicles = [[NSMutableArray alloc] init];

        for (NSMutableDictionary* voiture in vehiclesJSON) {
            Vehicule* tmp = [[Vehicule alloc] initFromDictionnary:voiture];
            [vehicles addObject:tmp];
        }
    
    NSNumber *instancingIntervale = [NSNumber numberWithFloat:[[NSDate date] timeIntervalSinceDate:startingDate]];
    [delegate showInstancingTime:instancingIntervale];

    [delegate receiveVehicles:vehicles];
}
@end
