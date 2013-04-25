//
//  InteractiveImageView.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/8/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//
//  InteractiveImageView implements a pannable/zoomable image


#import <UIKit/UIKit.h>


@interface InteractiveImageView : UIScrollView <UIScrollViewDelegate> {
    UIImageView *imageView;
}


- (void)setImage:(NSString *)imagePath;


@end
