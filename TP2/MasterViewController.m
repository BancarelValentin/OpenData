//
//  MasterViewController.m
//  TP2-bis
//
//  Created by Valentin Bancarel on 01/06/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Vehicule.h"
#import "Loader.h"

@interface MasterViewController ()

@property NSMutableArray* vehicles;
@property NSTimeInterval downloadingIntervale;
@property NSTimeInterval instancingIntervale;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://etudiants.openium.fr/lic/mars-2014-partial.json"];
    
    NSDate* startDate = [NSDate date];
    
    self.vehicles = [[NSMutableArray alloc] init];
    [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self didFinishDownloading:data startDate:startDate error:error];
        });
        
    }];
    [downloadTask resume];
    
    
//    
//    NSError *error;
//    
//    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
//    if( error ){
//        NSLog(@"%@", [error description]);
//        return nil;
//    }
//    
//    NSMutableDictionary *dict = [NSJSONSerialization
//                                 JSONObjectWithData:data
//                                 options:NSJSONReadingMutableContainers
//                                 error:&error];
//    if( error ){
//        NSLog(@"%@", [error description]);
//        return nil;
//    }
//    return dict;
}

- (void)didFinishDownloading:(NSData*)jsonData startDate:(NSDate*) startDate error:(NSError*) downloadError{
    
    NSError *serializationError = nil;
    NSMutableArray* voituresTelechargees = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&serializationError];
    
    NSDate* endDate = [NSDate date];
    self.downloadingIntervale = [endDate timeIntervalSinceDate:startDate];
    
    //Creating Vehicles
    startDate = [NSDate date];
    int i = 0;
    for (NSMutableDictionary* voiture in voituresTelechargees) {
        i++;
        Vehicule* tmp = [[Vehicule alloc] initFromDictionnary:voiture];
        [self.vehicles addObject:tmp];
        NSLog(@"%d: %@",i,tmp);
    }
    
    endDate = [NSDate date];
    self.instancingIntervale = [endDate timeIntervalSinceDate:startDate];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Vehicule *vehicule = self.vehicles[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:vehicule];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Vehicule *vehicule = self.vehicles[indexPath.row];
    cell.carIdLabel.text = [NSString stringWithFormat:@"%@ %@",[vehicule lib_mrq],[vehicule lib_mod]];
    cell.carDescLabel.text = [NSString stringWithFormat:@"%@",[vehicule cnit]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;

}

@end
