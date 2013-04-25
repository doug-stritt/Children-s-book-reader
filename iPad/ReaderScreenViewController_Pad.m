    //
//  ReaderScreenViewController_Pad.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "ReaderScreenViewController_Pad.h"


#define BUTTON_VERT_OFFSET 42


@implementation ReaderScreenViewController_Pad

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


- (ReaderScreenViewController_Pad *)initWithDelegate:(id <ScreenControlDelegate>)del {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        delegate = del;
        book = [Book sharedBook];
    }
    
    return self;
}


- (void)dealloc {
    [pageImageView release];
    [mainMenuButton release];
    [backButton release];
    [forwardButton release];
    [super dealloc];
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    NSLog(@"Load view");
    self.wantsFullScreenLayout = YES;
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    
    UIView *rootView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [rootView addGestureRecognizer:pinchRecognizer];
    [pinchRecognizer release];
    self.view = rootView;
    [rootView release];
    
    self.view.clipsToBounds = YES;
    
    // forcibly orient the screen to landscape
    self.view.transform = CGAffineTransformRotate(self.view.transform, M_PI/2);
    self.view.bounds = CGRectMake(0.0, 0.0, 1024.0, 768.0);
    
    [[self view] addSubview:[self pageImageView]];
    [[self view] addSubview:[self mainMenuButton]];
    [[self view] addSubview:[self backButton]];
    [[self view] addSubview:[self forwardButton]];
    
}


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
    [pageImageView release];
    [mainMenuButton release];
    [backButton release];
    [forwardButton release];
}


- (InteractiveImageView *)pageImageView {
    if (pageImageView == nil) {
        pageImageView = [[InteractiveImageView alloc] initWithFrame:self.view.bounds];
        [pageImageView setImage:[[NSBundle mainBundle] pathForResource:@"PrincessandtheFrog-DP_001" ofType:@"jpg" inDirectory:[book bundledBookPath]]];
        [pageImageView setScrollEnabled:NO];
        [pageImageView setBounces:NO];
    }
    
    return pageImageView;
}


- (UIButton *)mainMenuButton {
    if (mainMenuButton == nil) {
        UIImage *imgNormal = [UIImage imageNamed:[[book bundledBookPath] stringByAppendingPathComponent:@"btn_main_menu.png"]];
        UIImage *imgHighlighted = [UIImage imageNamed:[[book bundledBookPath] stringByAppendingPathComponent:@"btn_main_menu_tap.png"]];
        
        mainMenuButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [mainMenuButton setFrame:CGRectMake(0.0, 0.0, imgNormal.size.width, imgNormal.size.height)];
        [mainMenuButton setImage:imgNormal forState:UIControlStateNormal];
        [mainMenuButton setImage:imgHighlighted forState:UIControlStateHighlighted];
        [mainMenuButton setAdjustsImageWhenHighlighted:NO];
        [mainMenuButton addTarget:self action:@selector(mainMenuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return mainMenuButton;
}


- (UIButton *)backButton {
    if (backButton == nil) {
        UIImage *imgNormal = [UIImage imageNamed:@"btn_page_back.png"];
        UIImage *imgHighlighted = [UIImage imageNamed:@"btn_page_back_tap.png"];
        UIImage *imgDisabled = [UIImage imageNamed:@"btn_page_back_disabled.png"];
        
        backButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [backButton setFrame:CGRectMake(0.0,
                                        self.view.bounds.size.height/2 - imgNormal.size.height + BUTTON_VERT_OFFSET,
                                        imgNormal.size.width,
                                        imgNormal.size.height)];
        [backButton setImage:imgNormal forState:UIControlStateNormal];
        [backButton setImage:imgHighlighted forState:UIControlStateHighlighted];
        [backButton setImage:imgDisabled forState:UIControlStateDisabled];
        [backButton setAdjustsImageWhenHighlighted:NO];
        [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return backButton;
}


- (UIButton *)forwardButton {
    if (forwardButton == nil) {
        UIImage *imgNormal = [UIImage imageNamed:@"btn_page_next.png"];
        UIImage *imgHighlighted = [UIImage imageNamed:@"btn_page_next_tap.png"];
        UIImage *imgDisabled = [UIImage imageNamed:@"btn_page_next_disabled.png"];
        
        forwardButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [forwardButton setFrame:CGRectMake(self.view.bounds.size.width - imgNormal.size.width,
                                           self.view.bounds.size.height/2 - imgNormal.size.height + BUTTON_VERT_OFFSET,
                                           imgNormal.size.width,
                                           imgNormal.size.height)];
        [forwardButton setImage:imgNormal forState:UIControlStateNormal];
        [forwardButton setImage:imgHighlighted forState:UIControlStateHighlighted];
        [forwardButton setImage:imgDisabled forState:UIControlStateDisabled];
        [forwardButton setAdjustsImageWhenHighlighted:NO];
        [forwardButton addTarget:self action:@selector(forwardButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return forwardButton;
}


- (void)handlePinch:(UIGestureRecognizer *)sender {
    [pageImageView setScrollEnabled:YES];
}


- (void)mainMenuButtonPressed:(id)sender {
    NSLog(@"sender: %@", sender);
    [delegate close:self];
}


- (void)backButtonPressed:(id)sender {
    NSLog(@"backButtonPressed");
    NSLog(@"sender: %@", sender);
}


- (void)forwardButtonPressed:(id)sender {
    NSLog(@"forwardButtonPressed");
    NSLog(@"sender: %@", sender);
}




@end
