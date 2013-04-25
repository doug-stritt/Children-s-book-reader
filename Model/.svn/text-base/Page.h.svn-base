//
//  Page.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoConstants.h"
#import "Frame.h"


@interface Page : NSObject <NSCoding> {
    NSString *imageFileName;
    BOOL hasAuxiliaryContent;
    NSString *auxiliaryContentURL;
    NSArray *frames;
}


@property(nonatomic, readonly) NSString *imageFileName;
@property(readonly) BOOL hasAuxiliaryContent;
@property(nonatomic, readonly) NSString *auxiliaryContentURL;
@property(nonatomic, readonly) NSArray *frames;


- (Page *)initWithDictionary:(NSDictionary *)pageDict;


@end
