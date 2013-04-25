//
//  MasterController_Pad.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/5/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "MasterController_Pad.h"


@implementation MasterController_Pad


- (MasterController_Pad *)initWithWindow:(UIWindow *)theWindow {
    
    if ((self = [super init])) {
        window = theWindow;
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self pathOfArchivedBook]]) {
            book = [[NSKeyedUnarchiver unarchiveObjectWithFile:[self pathOfArchivedBook]] retain];
        } else {
            NSString *bookPlistPath = [[NSBundle mainBundle] pathForResource:@"Book"
                                                                      ofType:@"plist"
                                                                 inDirectory:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"BundledBookPath"]];
            book = [[Book alloc] initWithBookPlist:bookPlistPath];        
        }

        [window addSubview:[[self menuScreenViewController] view]];        
        [window makeKeyAndVisible];
    }
    
    return self;
}


- (void)dealloc {
    [book release];
    [menuScreenViewController release];
    [readerScreenViewController release];
    [super dealloc];
}


- (MenuScreenViewController_Pad *)menuScreenViewController {
    if (menuScreenViewController == nil) {
        menuScreenViewController = (MenuScreenViewController_Pad *)[[MenuScreenViewController_Pad alloc] initWithDelegate:self];
    }
    
    return menuScreenViewController;
}


- (ReaderScreenViewController_Pad *)readerScreenViewController {
    if (readerScreenViewController == nil) {
        readerScreenViewController = [(ReaderScreenViewController_Pad *)[ReaderScreenViewController_Pad alloc] initWithDelegate:self];
    }
    
    return readerScreenViewController;
}


- (void)close:(UIViewController *)screenViewController {
    NSLog(@"close: %@", screenViewController);
    [[screenViewController view] removeFromSuperview];
}


- (void)displayReaderScreen {
    NSLog(@"showReaderScreen");
    [window addSubview:[[self readerScreenViewController] view]];
}


- (NSString *)pathOfArchivedBook {
    // FIXME: create name based on bookID
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Archive"];
}


- (void) archiveBook {
    // FIXME: handle failure
    // FIXME: Book should probably archive itself
    [NSKeyedArchiver archiveRootObject:book toFile:[self pathOfArchivedBook]];
}



@end
