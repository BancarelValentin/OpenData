//
//  Loader.m
//  TP2
//
//  Created by Valentin Bancarel on 28/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "Loader.h"

@implementation Loader

-(id)getDictFromJSONUrl:(NSString *)urlString{
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
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
@end
