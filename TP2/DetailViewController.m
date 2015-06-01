//
//  DetailViewController.m
//  TP2-bis
//
//  Created by Valentin Bancarel on 01/06/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "DetailViewController.h"
#import "Vehicule.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbMarque;
@property (weak, nonatomic) IBOutlet UILabel *lbModele;
@property (weak, nonatomic) IBOutlet UILabel *lbCodeNational;
@property (weak, nonatomic) IBOutlet UILabel *lbCarburant;
@property (weak, nonatomic) IBOutlet UILabel *lbPowerAdmin;
@property (weak, nonatomic) IBOutlet UILabel *lbPowerMax;
@property (weak, nonatomic) IBOutlet UILabel *lbC02;
@property (weak, nonatomic) IBOutlet UILabel *lbCarrosserie;
@property (weak, nonatomic) IBOutlet UILabel *lbGamme;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.lbMarque.text = ((Vehicule *)self.detailItem).lib_mrq;
        self.lbModele.text = ((Vehicule *)self.detailItem).lib_mod_doss;
        self.lbCodeNational.text = ((Vehicule *)self.detailItem).cnit;
        self.lbCarburant.text = ((Vehicule *)self.detailItem).cod_cbr;
        self.lbPowerAdmin.text = [NSString stringWithFormat:@"%d", ((Vehicule *)self.detailItem).puiss_admin_98];
        self.lbPowerMax.text = [NSString stringWithFormat:@"%d", ((Vehicule *)self.detailItem).puiss_max];
        self.lbC02.text = [NSString stringWithFormat:@"%d", ((Vehicule *)self.detailItem).co2];
        self.lbCarrosserie.text = ((Vehicule *)self.detailItem).Carrosserie;
        self.lbGamme.text = ((Vehicule *)self.detailItem).gamme;
        
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
