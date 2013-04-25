//
//  AppDelegate_Pad.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/1/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "AppDelegate_Pad.h"


@implementation AppDelegate_Pad

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// disable app shutdown
	[[UIApplication sharedApplication] setIdleTimerDisabled: YES];
    
    masterController = [[MasterController_Pad alloc] initWithWindow:window];
	
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [masterController archiveBook];
}


- (void)dealloc {
    [masterController release];
    [window release];
    [super dealloc];
}


@end
