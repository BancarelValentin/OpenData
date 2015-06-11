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

@interface MasterViewController ()

@property NSArray* vehicles;

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

//The V1 should be use when the starting view is the SplitScreenView in the Main.storyboard. In this case no progress bar will be shown during the doznloading.
//The V2 should be use when the starting view is the LoadingView in the Main.storyboard. In this case a  progress bar will be shown during the downloading. Then the SplitScreenView will be shown zith a path to a JSON file given in parameter.

//V1
    Loader_Old *loader2 = [[Loader_Old alloc]init];
    [loader2 downloadFile:[NSURL URLWithString: @"http://etudiants.openium.fr/lic/mars-2014-partial-small.json"] for:self];

//V2
    //TO-DO: Get the path to the JSON file from the previous viewctrl and put it in self.pathToJSON
    self.pathToJSON = @"";
    Loader *loader = [[Loader alloc]init];
    [loader instanciateVehiclesFromJSON:[NSURL URLWithString:self.pathToJSON] andGiveThemTo:self];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
}

-(void)receiveVehicles:(NSArray *)vehicles{
    self.vehicles=vehicles;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
