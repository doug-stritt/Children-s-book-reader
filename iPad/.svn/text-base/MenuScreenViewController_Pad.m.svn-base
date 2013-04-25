    //
//  MenuScreenViewController_Pad.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/7/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "MenuScreenViewController_Pad.h"
#import "AudioManager.h"

@implementation MenuScreenViewController_Pad


@synthesize btnRead;
@synthesize btnStore;
@synthesize btnIndex;
@synthesize btnRecord;
@synthesize btnSettings;
@synthesize btnHelp;
@synthesize btnCreate;
@synthesize ivBookCover;



typedef enum
{
	MenuButtonNone,
	MenuButtonRead,
	MenuButtonIndex,
	MenuButtonRecord,
	MenuButtonCreate,
	MenuButtonStore,
	MenuButtonSettings,
	MenuButtonHelp
}MenuButton;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


- (MenuScreenViewController_Pad *)initWithDelegate:(id <ScreenControlDelegate>)del {
    if ((self = [super initWithNibName:@"MenuScreenView" bundle:[NSBundle mainBundle]])) {
        delegate = del;
        book = [Book sharedBook];
		intButtonPress = 0;
		
		// add book cover image
		NSString *bookCoverPath = [[NSBundle mainBundle] pathForResource:@"img_main_menu_cover_title"
																  ofType:@"png"
															 inDirectory:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"BundledBookPath"]];
		UIImage *imgBookCover = [UIImage imageWithContentsOfFile:bookCoverPath];
		UIImageView *bookCoverView = [[UIImageView alloc ] initWithFrame:CGRectMake(0.0f, 0.0f, 1024.0f, 768.0f)];
		[bookCoverView setImage:imgBookCover];
		[self.view addSubview:bookCoverView];
		[bookCoverView release];
		
		// set button highlighting
		[self setButtonHighlights];
    }

    
    return self;
}


- (void)dealloc {
    [super dealloc];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    self.wantsFullScreenLayout = YES;
 
    UITapGestureRecognizer *tempRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    UIView *rootView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [rootView setBackgroundColor:[UIColor redColor]];
    [rootView addGestureRecognizer:tempRecognizer];
    [tempRecognizer release];
    
    self.view = rootView;
    [rootView release];
    

}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (IBAction)handleReadTap:(id)sender {
	[[AudioManager sharedAudioManager] playFirstMenuBtn];
	if (intButtonPress == MenuButtonRead) {
		[delegate displayReaderScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonRead;
		[self resetButtons];
		[btnRead setImage:[UIImage imageNamed:@"btn_menu_read_tap.png"] forState:UIControlStateNormal];
	}
}


- (IBAction)handleIndexTap:(id)sender {
	[[AudioManager sharedAudioManager] playSecondMenuBtn];
	if (intButtonPress == MenuButtonIndex) {
		//[delegate displayIndexScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonIndex;
		[self resetButtons];
		[btnIndex setImage:[UIImage imageNamed:@"btn_menu_index_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (IBAction)handleRecordTap:(id)sender {
	[[AudioManager sharedAudioManager] playThirdMenuBtn];
	if (intButtonPress == MenuButtonRecord) {
		//[delegate displayRecordScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonRecord;
		[self resetButtons];
		[btnRecord setImage:[UIImage imageNamed:@"btn_menu_record_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (IBAction)handleCreateTap:(id)sender {
	[[AudioManager sharedAudioManager] playFourthMenuBtn];
	if (intButtonPress == MenuButtonCreate) {
		//[delegate displayCreateScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonCreate;
		[self resetButtons];
		[btnCreate setImage:[UIImage imageNamed:@"btn_menu_create_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (IBAction)handleStoreTap:(id)sender {
	[[AudioManager sharedAudioManager] playFifthMenuBtn];
	if (intButtonPress == MenuButtonStore) {
		//[delegate displayStoreScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonStore;
		[self resetButtons];
		[btnStore setImage:[UIImage imageNamed:@"btn_menu_store_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (IBAction)handleSettingsTap:(id)sender {
	[[AudioManager sharedAudioManager] playSixthMenuBtn];
	if (intButtonPress == MenuButtonSettings) {
		//[delegate displaySettingsScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonSettings;
		[self resetButtons];
		[btnSettings setImage:[UIImage imageNamed:@"btn_menu_settings_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (IBAction)handleHelpTap:(id)sender {
	[[AudioManager sharedAudioManager] playSixthMenuBtn];
	if (intButtonPress == MenuButtonHelp) {
		//[delegate displayHelpScreen];
		intButtonPress = 0;
		[self resetButtons];
	} else {
		intButtonPress = MenuButtonHelp;
		[self resetButtons];
		[btnHelp setImage:[UIImage imageNamed:@"btn_menu_help_tap.png"] forState:UIControlStateNormal];
	}
    
}


- (void)resetButtons {
	[btnRead setImage:[UIImage imageNamed:@"btn_menu_read.png"] forState:UIControlStateNormal];
	[btnIndex setImage:[UIImage imageNamed:@"btn_menu_index.png"] forState:UIControlStateNormal];
	[btnRecord setImage:[UIImage imageNamed:@"btn_menu_record.png"] forState:UIControlStateNormal];
	[btnCreate setImage:[UIImage imageNamed:@"btn_menu_create.png"] forState:UIControlStateNormal];
	[btnStore setImage:[UIImage imageNamed:@"btn_menu_store.png"] forState:UIControlStateNormal];
	[btnSettings setImage:[UIImage imageNamed:@"btn_menu_settings.png"] forState:UIControlStateNormal];
	[btnHelp setImage:[UIImage imageNamed:@"btn_menu_help.png"] forState:UIControlStateNormal];
}


- (void)setButtonHighlights {
	[btnRead setImage:[UIImage imageNamed:@"btn_menu_read.png"] forState:UIControlStateHighlighted];
	[btnIndex setImage:[UIImage imageNamed:@"btn_menu_index.png"] forState:UIControlStateHighlighted];
	[btnRecord setImage:[UIImage imageNamed:@"btn_menu_record.png"] forState:UIControlStateHighlighted];
	[btnCreate setImage:[UIImage imageNamed:@"btn_menu_create.png"] forState:UIControlStateHighlighted];
	[btnStore setImage:[UIImage imageNamed:@"btn_menu_store.png"] forState:UIControlStateHighlighted];
	[btnSettings setImage:[UIImage imageNamed:@"btn_menu_settings.png"] forState:UIControlStateHighlighted];
	[btnHelp setImage:[UIImage imageNamed:@"btn_menu_help.png"] forState:UIControlStateHighlighted];
}



@end
