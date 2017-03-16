//
//  ViewController.m
//  InstagramImagePicker
//
//  Created by Deon Botha on 13/12/2013.
//  Copyright (c) 2013 Deon Botha. All rights reserved.
//

#import "ViewController.h"
#import "OLInstagramImagePickerController.h"
#import "OLInstagramMedia.h"

@interface ViewController () <OLInstagramImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray *selectedImages;
@end

@implementation ViewController

- (IBAction)onShowInstagramImagePickerClicked:(id)sender {
    OLInstagramImagePickerController *imagePicker = [[OLInstagramImagePickerController alloc] initWithClientId:@"a6a09c92a14d488baa471e5209906d3d" secret:@"bfb814274cd041a5b7e06f32608e0e87" redirectURI:@"kite://instagram-callback"];
    imagePicker.delegate = self;
    imagePicker.selected = self.selectedImages;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - OLInstagramImagePickerControllerDelegate methods

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFailWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFinishPickingImages:(NSArray/*<OLInstagramMedia>*/ *)images {
    self.selectedImages = images;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    for (OLInstagramMedia *image in images) {
        NSLog(@"User selected instagram image with full URL: %@ lat: %f lon: %f", image.fullURL, image.latitude.doubleValue, image.longitude.doubleValue);
    }
}

- (void)instagramImagePickerDidCancelPickingImages:(OLInstagramImagePickerController *)imagePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
