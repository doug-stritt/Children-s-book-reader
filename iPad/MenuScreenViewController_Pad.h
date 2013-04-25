//
//  MenuScreenViewController_Pad.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/7/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "ScreenControlDelegate.h"


@interface MenuScreenViewController_Pad : UIViewController {
    id <ScreenControlDelegate> delegate;
    Book *book;
	
	IBOutlet UIButton *btnRead;
	IBOutlet UIButton *btnStore;
	IBOutlet UIButton *btnIndex;
	IBOutlet UIButton *btnRecord;
	IBOutlet UIButton *btnSettings;
	IBOutlet UIButton *btnHelp;
	IBOutlet UIButton *btnCreate;
	
	IBOutlet UIImageView *ivBookCover;
	
	int intButtonPress;
}

@property (nonatomic, retain) IBOutlet UIButton *btnRead;
@property (nonatomic, retain) IBOutlet UIButton *btnStore;
@property (nonatomic, retain) IBOutlet UIButton *btnIndex;
@property (nonatomic, retain) IBOutlet UIButton *btnRecord;
@property (nonatomic, retain) IBOutlet UIButton *btnSettings;
@property (nonatomic, retain) IBOutlet UIButton *btnHelp;
@property (nonatomic, retain) IBOutlet UIButton *btnCreate;
@property (nonatomic, retain) IBOutlet UIImageView *ivBookCover;

- (IBAction)handleReadTap:(id)sender;
- (IBAction)handleStoreTap:(id)sender;
- (IBAction)handleIndexTap:(id)sender;
- (IBAction)handleRecordTap:(id)sender;
- (IBAction)handleSettingsTap:(id)sender;
- (IBAction)handleHelpTap:(id)sender;
- (IBAction)handleCreateTap:(id)sender;

- (MenuScreenViewController_Pad *)initWithDelegate:(id <ScreenControlDelegate>)del;

- (void)resetButtons;
- (void)setButtonHighlights;

@end
