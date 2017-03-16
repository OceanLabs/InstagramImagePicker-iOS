//
//  InstagramImage.m
//  Ps
//
//  Created by Deon Botha on 10/12/2013.
//  Copyright (c) 2013 dbotha. All rights reserved.
//

#import "OLInstagramMedia.h"

static NSString *const kKeyThumbURL = @"co.oceanlabs.InstagramImagePicker.kKeyThumbURL";
static NSString *const kKeyFullURL = @"co.oceanlabs.InstagramImagePicker.kKeyFullURL";

@implementation OLInstagramMedia
- (id)initWithThumbURL:(nonnull NSURL *)thumbURL
               fullURL:(nonnull NSURL *)fullURL
             mediaType:(OLInstagramMediaType)mediaType
               caption:(nullable NSString *)caption
              latitude:(nullable NSNumber*)latitude
             longitude:(nullable NSNumber*)longitude {
    if (self = [super init]) {
        _thumbURL = thumbURL;
        _fullURL = fullURL;
        _type = mediaType;
        _caption = [caption isKindOfClass:[NSString class]] ? caption : @"";
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[OLInstagramMedia class]]) {
        return NO;
    }
    
    return [self.thumbURL isEqual:[object thumbURL]] && [self.fullURL isEqual:[object fullURL]];
}

- (NSUInteger)hash {
    return self.thumbURL.hash + self.fullURL.hash;
}

#pragma mark - NSCoding protocol methods

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.thumbURL forKey:kKeyThumbURL];
    [aCoder encodeObject:self.fullURL forKey:kKeyFullURL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _thumbURL = [aDecoder decodeObjectForKey:kKeyThumbURL];
        _fullURL = [aDecoder decodeObjectForKey:kKeyFullURL];
    }
    
    return self;
}

#pragma mark - NSCopying protocol methods

- (id)copyWithZone:(NSZone *)zone {
    OLInstagramMedia *copy = [[OLInstagramMedia allocWithZone:zone] initWithThumbURL:self.thumbURL
                                                                             fullURL:self.fullURL
                                                                           mediaType:self.type
                                                                             caption:self.caption
                                                                            latitude:self.latitude
                                                                           longitude:self.longitude];
    return copy;
}

@end
