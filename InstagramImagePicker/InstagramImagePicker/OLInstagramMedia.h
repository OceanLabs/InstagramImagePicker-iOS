//
//  OLInstagramMedia.h
//  Ps
//
//  Created by Deon Botha on 10/12/2013.
//  Copyright (c) 2013 dbotha. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum OLInstagramMediaType {
    OLInstagramMediaTypeImage,
    OLInstagramMediaTypeVideo
} OLInstagramMediaType;

/**
 The OLInstagramMedia class provides a simple model object representation of an Instagram image.
 */
@interface OLInstagramMedia : NSObject <NSCoding, NSCopying>

/**
 Initialises a new OLInstagramMedia object instance.
 
 @param thumbURL The URL to access the thumbnail
 @param fullURL The URL to access the standard resolution image or video
 @param mediaType The type of media
 @param caption The caption of media
 @param latitude The latitude of medaia
 @param longitude The longitude of medaia
 @return Returns an initialised OLInstagramMedia instance
 */
- (_Nonnull id)initWithThumbURL:(nonnull NSURL *)thumbURL
                        fullURL:(nonnull NSURL *)fullURL
                      mediaType:(OLInstagramMediaType)mediaType
                        caption:(nullable NSString *)caption
                       latitude:(nullable NSNumber*)latitude
                      longitude:(nullable NSNumber*)longitude;

/**
 The URL to access the thumb image
 */
@property (nonatomic, readonly, nonnull) NSURL *thumbURL;

/**
 The URL to access the media - standart resolution for image or to video
 */
@property (nonatomic, readonly, nonnull) NSURL *fullURL;

/**
 The access the caption of media
 */
@property (nonatomic, readonly, nonnull) NSString *caption;

/**
 The access the latitude of media if possible
 */
@property (nonatomic, readonly, nullable) NSNumber *latitude;

/**
 The access the longitude of media if possible
 */
@property (nonatomic, readonly, nullable) NSNumber *longitude;

/**
 The access the media type
 */
@property (nonatomic, readonly) OLInstagramMediaType type;

@end
