//
//  MasterController_Pad.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/5/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "MenuScreenViewController_Pad.h"
#import "ReaderScreenViewController_Pad.h"
#import "ScreenControlDelegate.h"


@interface MasterController_Pad : NSObject <ScreenControlDelegate> {
    UIWindow *window;
    Book *book;
    MenuScreenViewController_Pad *menuScreenViewController;
    ReaderScreenViewController_Pad *readerScreenViewController;
}


- (MasterController_Pad *)initWithWindow:(UIWindow *)theWindow;

- (MenuScreenViewController_Pad *)menuScreenViewController;
- (ReaderScreenViewController_Pad *)readerScreenViewController;

- (NSString *)pathOfArchivedBook;
- (void)archiveBook;


@end
