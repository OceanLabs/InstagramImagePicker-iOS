//
//  UIImageView+InstagramFadeIn.m
//  InstagramImagePicker
//
//  Created by Deon Botha on 23/03/2015.
//  Copyright (c) 2015 Deon Botha. All rights reserved.
//

#import "UIImageView+InstagramFadeIn.h"
#import "OLInstagramImageDownloader.h"

@implementation UIImageView (InstagramFadeIn)
- (void)setAndFadeInInstagramImageWithURL:(NSURL *)url {
    [self setAndFadeInInstagramImageWithURL:url placeholder:nil];
}

- (void)setAndFadeInInstagramImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder {
    self.alpha = 0;
    
    [[OLInstagramImageDownloader sharedInstance] downloadImageAtURL:url withCompletionHandler:^(UIImage *image, NSError *error){
        self.image = image;
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        self.alpha = 1;
        [UIView commitAnimations];
        
    }];
    
}
@end
