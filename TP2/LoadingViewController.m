//
//  LoadingViewController.m
//  TP2
//
//  Created by bancarel valentin on 11/06/15.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "LoadingViewController.h"
#import "MasterViewController.h"

@interface LoadingViewController ()
@property NSDate *startDownloadTime;
@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loadingProgressBar setProgress:0 animated:YES];
    
    Loader *loader = [[Loader alloc]init];
    [loader downloadFile:[NSURL URLWithString: @"http://etudiants.openium.fr/lic/mars-2014-partial.json"] for:self];
    self.startDownloadTime = [NSDate date];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    NSNumber *percentDL = [NSNumber numberWithFloat: ((float)bytesWritten / (float)totalBytesExpectedToWrite)];
    [self performSelectorOnMainThread:@selector(setProgressBarToValue:) withObject:percentDL waitUntilDone:NO];

}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSNumber *dlTime = [NSNumber numberWithFloat: [[NSDate date] timeIntervalSinceDate:self.startDownloadTime]];
    [self performSelectorOnMainThread:@selector(setProgressBarToValue:) withObject:[NSNumber numberWithFloat:1] waitUntilDone:NO];
    [self performSelectorOnMainThread:@selector(showDownloadTime:) withObject:dlTime waitUntilDone:NO];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *JSONPath = [self getPathToJSONFile];
    if ([fileManager fileExistsAtPath:JSONPath] == YES) {
        [fileManager removeItemAtPath:JSONPath error:&error];
    }
    
    [fileManager moveItemAtPath:location.path toPath:JSONPath error:&error];
    
    [self performSegueWithIdentifier:@"showMasterView" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMasterView"])
    {
        UISplitViewController *svc = [segue destinationViewController] ;
        MasterViewController *mvc = [[svc.viewControllers firstObject] topViewController];
        NSString *JSONPath = [self getPathToJSONFile];
        [mvc setPathToJSON:JSONPath];
    }
}

-(NSString*)getPathToJSONFile{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *JSONPath = [documentsDirectory stringByAppendingPathComponent:@"vehicles.JSON"];
    return JSONPath;
}

-(void)setProgressBarToValue:(NSNumber*) progress{
    [self.loadingProgressBar setProgress:[progress floatValue]];
}

-(void)showDownloadTime:(NSNumber*)time{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Stats" message:[NSString stringWithFormat:@"Il a fallut %@ secondes pour télécharger le fichier",time] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
