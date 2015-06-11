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
@implementation Loader

-(void)downloadFile:(NSURL*)url for:(id)delegate{
    [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
        });
        
    }];
    [downloadTask resume];
    //TO-DO: Dont know how, but i need to say that downloadTask to use the delegate passed in parameters as HIS delegate in order to handle the downloading and downloaded state
}

-(void)instanciateVehiclesFromJSON:(NSURL *)url andGiveThemTo:(id)delegate{

    NSData *JSONData = [NSData dataWithContentsOfFile:@""];
    NSError *serializationError;

        NSMutableArray* vehiclesJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&serializationError];
        NSMutableArray* vehicles = [[NSMutableArray alloc] init];

        for (NSMutableDictionary* voiture in vehiclesJSON) {
            Vehicule* tmp = [[Vehicule alloc] initFromDictionnary:voiture];
            [vehicles addObject:tmp];
        }

    [delegate receiveVehicles:vehicles];
}
@end
