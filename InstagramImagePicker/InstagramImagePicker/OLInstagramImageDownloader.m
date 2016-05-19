//
//  OLImageDownloader.m
//  KitePrintSDK
//
//  Created by Konstadinos Karayannis on 17/05/16.
//  Copyright © 2016 Kite.ly. All rights reserved.
//

#import "OLInstagramImageDownloader.h"
#import "OLInstagramImageDownloadDelegate.h"

@interface OLInstagramImageDownloader ()

@end

@implementation OLInstagramImageDownloader

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static OLInstagramImageDownloader *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BOOL)cachedDataExistForURL:(NSURL *)url{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSCachedURLResponse *cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
    return cachedResponse.data != nil;
}

- (NSURLSessionDownloadTask *)downloadImageAtURL:(NSURL *)url withCompletionHandler:(void(^)(UIImage *image, NSError *error))handler{
    return [self downloadImageAtURL:url progress:NULL withCompletionHandler:handler];
}

- (NSURLSessionDownloadTask *)downloadImageAtURL:(NSURL *)url progress:(void(^)(NSInteger progress, NSInteger total))progressHandler withCompletionHandler:(void(^)(UIImage *image, NSError *error))handler{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    OLInstagramImageDownloadDelegate *delegate = [[OLInstagramImageDownloadDelegate alloc] init];
    delegate.progressHandler = progressHandler;
    
    
    NSCachedURLResponse *cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
    if (cachedResponse.data){
        handler([UIImage imageWithData:cachedResponse.data], nil);
        return nil;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:delegate delegateQueue:nil];
    
    delegate.completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error){
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(nil, error);
            });
        }
        else if (data){
            NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:data userInfo:nil storagePolicy:NSURLCacheStorageAllowed];
            [configuration.URLCache storeCachedResponse:cachedResponse forRequest:request];
            dispatch_async(dispatch_get_main_queue(), ^{
                handler([UIImage imageWithData:data], nil);
            });
        }
    };
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request];
    [downloadTask resume];
    return downloadTask;
}

@end
