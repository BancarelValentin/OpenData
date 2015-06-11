//
//  CustomCellTableViewCell.h
//  TP2
//
//  Created by bancarel valentin on 02/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *carDescLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end
