//
//  Loader.h
//  TP2
//
//  Created by Valentin Bancarel on 28/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Loader : NSObject

-(void)downloadFile:(NSURL*)url for:(id)delegate;
-(void)instanciateVehiclesFromJSON:(NSURL*)url andGiveThemTo:(id)delegate;

@end

@protocol vehicleHandler //Doit etre implementer par le MasterViewController pour recevoir les vehicules et afficher la pop-up pour le temp d'instanciation
- (void)receiveVehicles:(NSArray *)vehicles;
-(void)showInstancingTime:(NSNumber*)time;
@end