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

@property (weak, nonatomic) IBOutlet UILabel *lbCarrosserie;
@property (weak, nonatomic) IBOutlet UILabel *lbGamme;
@property (weak, nonatomic) IBOutlet UILabel *lbDscom;

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
        self.lbCarrosserie.text = ((Vehicule *)self.detailItem).Carrosserie;
        self.lbGamme.text = ((Vehicule *)self.detailItem).gamme;
        self.lbDscom.text = ((Vehicule *)self.detailItem).dscom;
        
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
