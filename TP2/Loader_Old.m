//
//  Loader_Old.m
//  TP2
//
//  Created by bancarel valentin on 11/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "Loader_Old.h"
#import "Vehicule.h"

@interface Loader_Old ()


@property NSTimeInterval downloadingInterval;
@property NSTimeInterval creatingInterval;

@end


@implementation Loader_Old

-(void)downloadFile:(NSURL*)url for:(id)delegate{
        self.delegate = delegate;
        NSDate* startDate = [NSDate date];

    [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        dispatch_async(dispatch_get_main_queue(), ^{
                        [self didFinishDownloading:data startDate:startDate error:error];
        });

    }];
    [downloadTask resume];

}
- (void)didFinishDownloading:(NSData*)jsonData startDate:(NSDate*) startDate error:(NSError*) downloadError{

    NSError *serializationError = nil;
    NSMutableArray* voituresTelechargees = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&serializationError];

    NSTimeInterval downloadingIntervale = [[NSDate date] timeIntervalSinceDate:startDate];

    //Creating Vehicles
    startDate = [NSDate date];

    NSMutableArray* vehicles = [[NSMutableArray alloc] init];
    for (NSMutableDictionary* voiture in voituresTelechargees) {
        Vehicule* tmp = [[Vehicule alloc] initFromDictionnary:voiture];
        [vehicles addObject:tmp];
    }

    NSTimeInterval instancingIntervale = [[NSDate date] timeIntervalSinceDate:startDate];

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Stats" message:[NSString stringWithFormat:@"Il a fallut %f secondes pour télécharger le fichier et %f secondes pour instancier tous les objets",downloadingIntervale,instancingIntervale] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

    [self.delegate receiveVehicles:vehicles];
}
@end
