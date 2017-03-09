//
//  InstagramImage.h
//  Ps
//
//  Created by Deon Botha on 10/12/2013.
//  Copyright (c) 2013 dbotha. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 The OLInstagramImage class provides a simple model object representation of an Instagram image.
 */
@interface OLInstagramImage : NSObject <NSCoding, NSCopying>

/**
 Initialises a new OLInstagramImage object instance.
 
 @param thumbURL The URL to access the thumbnail image
 @param fullURL The URL to access the standard resolution image
 @return Returns an initialised OLInstagramImage instance
 */
- (_Nonnull id)initWithThumbURL:(nonnull NSURL *)thumbURL fullURL:(nonnull NSURL *)fullURL caption:(nullable NSString *)caption latitude:(nullable NSNumber*)latitude longitude:(nullable NSNumber*)longitude;

/**
 The URL to access the thumb resolution image
 */
@property (nonatomic, readonly, nonnull) NSURL *thumbURL;

/**
 The URL to access the standard resolution image
 */
@property (nonatomic, readonly, nonnull) NSURL *fullURL;

/**
 The access the caption of image
 */
@property (nonatomic, readonly, nullable) NSString *caption;

/**
 The access the latitude of image if possible
 */
@property (nonatomic, readonly, nullable) NSNumber *latitude;

/**
 The access the longitude of image if possible
 */
@property (nonatomic, readonly, nullable) NSNumber *longitude;



@end
