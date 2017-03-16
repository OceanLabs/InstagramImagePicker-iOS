//
//  ImagePickerCell.m
//  Ps
//
//  Created by Deon Botha on 10/12/2013.
//  Copyright (c) 2013 dbotha. All rights reserved.
//

#import "OLInstagramImagePickerCell.h"
#import "UIImageView+InstagramFadeIn.h"
#import "OLInstagramMedia.h"

#define kThumbnailLength    78.0f
#define kThumbnailSize      CGSizeMake(kThumbnailLength, kThumbnailLength)
#

@interface OLInstagramImagePickerCell ()
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic, strong) OLInstagramMedia *instagramMedia;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *checkImageView;
@property (nonatomic, strong) UIView *selectedDisabledOverlayView;
@end

@implementation OLInstagramImagePickerCell

static UIFont *titleFont = nil;

static CGFloat titleHeight;
static UIColor *titleColor;
static UIImage *checkedIcon;
static UIColor *selectedColor;
static UIColor *disabledColor;

+ (void)initialize {
    titleFont       = [UIFont systemFontOfSize:12];
    titleHeight     = 20.0f;
    titleColor      = [UIColor whiteColor];
    
    selectedColor   = [UIColor colorWithWhite:1 alpha:0.3];
    disabledColor   = [UIColor colorWithWhite:1 alpha:0.9];
    
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
    {
        checkedIcon = [UIImage imageNamed:@"CTAssetsPickerChecked" inBundle:[NSBundle bundleForClass:[OLInstagramImagePickerCell class]] compatibleWithTraitCollection:nil];
    }
    else
    {
        checkedIcon = [UIImage imageNamed:@"CTAssetsPickerChecked"];
    }
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.opaque = YES;
        self.backgroundColor = [UIColor colorWithWhite:0.969 alpha:1.000];
        CGRect f = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.imageView = [[UIImageView alloc] initWithFrame:f];
        self.checkImageView = [[UIImageView alloc] initWithImage:checkedIcon];
        self.selectedDisabledOverlayView = [[UIView alloc] initWithFrame:f];
        self.selectedDisabledOverlayView.backgroundColor = selectedColor;
        self.selectedDisabledOverlayView.opaque = YES;
        self.selectedDisabledOverlayView.hidden = YES;
        
        self.checkImageView.frame = CGRectMake(f.size.width - checkedIcon.size.width, 0, self.checkImageView.frame.size.width, self.checkImageView.frame.size.height);
        self.checkImageView.hidden = YES;
        
        [self addSubview:self.imageView];
        [self addSubview:self.selectedDisabledOverlayView];
        [self addSubview:self.checkImageView];
    }
    
    return self;
}

- (void)bind:(OLInstagramMedia *)media {
    self.instagramMedia = media;
    [self.imageView setAndFadeInInstagramImageWithURL:media.thumbURL];
    
    if (media.type == OLInstagramMediaTypeVideo) {
        UIImageView *camera = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"videocam_white"]];
        camera.alpha = 0.75;
        [self.imageView addSubview:camera];
        camera.center = CGPointMake(self.imageView.bounds.size.width / 2.0, self.imageView.bounds.size.height / 2.0);
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.selectedDisabledOverlayView.hidden = !selected;
    self.checkImageView.hidden = !selected;
}

@end
