//
//  InstagramImage.m
//  Ps
//
//  Created by Deon Botha on 10/12/2013.
//  Copyright (c) 2013 dbotha. All rights reserved.
//

#import "OLInstagramImage.h"

@implementation OLInstagramImage
- (id)initWithThumbURL:(NSURL *)thumbURL fullURL:(NSURL *)fullURL {
    if (self = [super init]) {
        _thumbURL = thumbURL;
        _fullURL = fullURL;
    }
    
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[OLInstagramImage class]]) {
        return NO;
    }
    
    return [self.thumbURL isEqual:[object thumbURL]] && [self.fullURL isEqual:[object fullURL]];
}

- (NSUInteger)hash {
    return self.thumbURL.hash + self.fullURL.hash;
}

@end
