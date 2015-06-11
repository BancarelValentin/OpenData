//
//  MasterViewController.h
//  TP2-bis
//
//  Created by Valentin Bancarel on 01/06/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "Loader.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <vehicleHandler,NSURLSessionDownloadDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

-(void)receiveVehicles:(NSArray*)vehicles;

@end

