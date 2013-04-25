//
//  InteractiveImageView.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/8/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "InteractiveImageView.h"


@implementation InteractiveImageView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        imageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:imageView];
        imageView.contentMode = UIViewContentModeTopLeft;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.clipsToBounds = NO;
    }
    return self;
}


- (void)dealloc {
    [imageView release];
    [super dealloc];
}


- (void)setImage:(NSString *)imagePath {
    UIImage *newImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
    [imageView setImage:newImage];
    self.contentSize = newImage.size;
    [newImage release];
    
}


@end
