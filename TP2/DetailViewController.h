//
//  DetailViewController.h
//  TP2-bis
//
//  Created by Valentin Bancarel on 01/06/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

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

