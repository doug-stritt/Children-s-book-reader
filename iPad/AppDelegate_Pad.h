//
//  AppDelegate_Pad.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/1/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterController_Pad.h"

@interface AppDelegate_Pad : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MasterController_Pad *masterController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

