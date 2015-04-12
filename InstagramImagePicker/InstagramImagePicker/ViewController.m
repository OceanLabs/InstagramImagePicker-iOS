//
//  ViewController.m
//  InstagramImagePicker
//
//  Created by Deon Botha on 13/12/2013.
//  Copyright (c) 2013 Deon Botha. All rights reserved.
//

#import "ViewController.h"
#import "OLInstagramImagePickerController.h"
#import "OLInstagramImage.h"

@interface ViewController () <OLInstagramImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray *selectedImages;
@end

@implementation ViewController

- (IBAction)onShowInstagramImagePickerClicked:(id)sender {
    OLInstagramImagePickerController *imagePicker = [[OLInstagramImagePickerController alloc] initWithClientId:@"YOUR_CLIENT_ID" secret:@"YOUR_CLIENT_SECRET" redirectURI:@"YOUR-APP-SCHEME://instagram-callback"];
    imagePicker.delegate = self;
    imagePicker.selected = self.selectedImages;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - OLInstagramImagePickerControllerDelegate methods

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFailWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFinishPickingImages:(NSArray/*<OLInstagramImage>*/ *)images {
    self.selectedImages = images;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    for (OLInstagramImage *image in images) {
        NSLog(@"User selected instagram image with full URL: %@", image.fullURL);
    }
}

- (void)instagramImagePickerDidCancelPickingImages:(OLInstagramImagePickerController *)imagePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
