//
//  UIImageView+InstagramFadeIn.m
//  InstagramImagePicker
//
//  Created by Deon Botha on 23/03/2015.
//  Copyright (c) 2015 Deon Botha. All rights reserved.
//

#import "UIImageView+InstagramFadeIn.h"
#import "OLInstagramImageDownloader.h"
#import "objc/runtime.h"

static char tasksKey;

@implementation UIImageView (InstagramFadeIn)
- (void)setAndFadeInInstagramImageWithURL:(NSURL *)url {
    [self setAndFadeInInstagramImageWithURL:url placeholder:nil completionHandler:NULL];
}

-(void)setAndFadeInInstagramImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder{
    [self setAndFadeInInstagramImageWithURL:url placeholder:placeholder completionHandler:NULL];
}

-(void)setAndFadeInInstagramImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completionHandler:(void(^)())handler{
    for (id key in self.tasks.allKeys){
        if (![key isEqual:url]){
            [self.tasks[key] cancel];
        }
    }
    
    self.alpha = 0;
    NSURLSessionTask *task = [[OLInstagramImageDownloader sharedInstance] downloadImageAtURL:url withCompletionHandler:^(UIImage *image, NSError *error){
        if ([self.tasks[url] state] == NSURLSessionTaskStateCanceling){
            [self.tasks removeObjectForKey:url];
            return;
        }
        [self.tasks removeObjectForKey:url];
        self.image = image;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alpha = 1;
        }completion:^(BOOL finished){
            if (handler){
                handler();
            }
        }];
        
    }];
    self.tasks[url] = task;
}

- (NSMutableDictionary *)tasks{
    NSMutableDictionary *tasks = objc_getAssociatedObject(self, &tasksKey);
    if (tasks){
        return tasks;
    }
    tasks = [[NSMutableDictionary alloc] init];
    objc_setAssociatedObject(self, &tasksKey, tasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tasks;
}

@end
