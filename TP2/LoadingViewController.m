//
//  LoadingViewController.m
//  TP2
//
//  Created by bancarel valentin on 11/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "LoadingViewController.h"
#import "MasterViewController.h"
#import "Loader.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loadingProgressBar setProgress:0];
    
    Loader *loader = [[Loader alloc]init];
    [loader downloadFile:[NSURL URLWithString: @"http://etudiants.openium.fr/lic/mars-2014-partial-small.json"] for:self];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    float percentDL = totalBytesWritten / totalBytesExpectedToWrite;
    [self.loadingProgressBar setProgress:percentDL];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    //TO-DO: Launch the master view controller and give him the file location
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
