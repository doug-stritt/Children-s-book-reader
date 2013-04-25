//
//  ReaderScreenViewController_Pad.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenControlDelegate.h"
#import "Book.h"
#import "InteractiveImageView.h"


@interface ReaderScreenViewController_Pad : UIViewController {
    id <ScreenControlDelegate> delegate;
    Book *book;
    InteractiveImageView *pageImageView;
    UIButton *mainMenuButton;
    UIButton *backButton;
    UIButton *forwardButton;
}


- (ReaderScreenViewController_Pad *)initWithDelegate:(id <ScreenControlDelegate>)del;

- (InteractiveImageView *)pageImageView;
- (UIButton *)mainMenuButton;
- (UIButton *)backButton;
- (UIButton *)forwardButton;

- (void)handlePinch:(UIGestureRecognizer *)sender;
- (void)mainMenuButtonPressed:(id)sender;
- (void)backButtonPressed:(id)sender;
- (void)forwardButtonPressed:(id)sender;


@end
