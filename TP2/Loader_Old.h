//
//  Loader_Old.h
//  TP2
//
//  Created by bancarel valentin on 11/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Loader_Old : NSObject

@property id delegate;

-(void)downloadFile:(NSURL*)url for:(id)delegate;

@end

@protocol vehicleHandler
- (void)receiveVehicles:(NSArray *)vehicles;
@end
