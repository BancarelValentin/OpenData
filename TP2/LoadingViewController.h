//
//  LoadingViewController.h
//  TP2
//
//  Created by bancarel valentin on 11/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface LoadingViewController : UIViewController <NSURLSessionDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *loadingProgressBar;
@end
