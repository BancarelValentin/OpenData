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
    
    Loader *loader = [[Loader alloc]init];
    [loader instanciateVehiclesFromJSON:[NSURL URLWithString:self.pathToJSON] andGiveThemTo:self];
}

-(void)showInstancingTime:(NSNumber*)time{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Stats" message:[NSString stringWithFormat:@"Il a fallut %@ secondes pour instancier les objets",time] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
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
