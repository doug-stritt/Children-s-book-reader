//
//  AudioTrack.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoConstants.h"


@interface AudioTrack : NSObject <NSCoding> {
    NSUInteger trackID;
    BOOL isEditable;
    NSString *displayName;
}


@property(readonly) NSUInteger trackID;
@property BOOL isEditable;
@property(nonatomic, retain) NSString *displayName;


- (AudioTrack *)initWithDisplayName:(NSString *)name trackID:(NSUInteger)tid editable:(BOOL)editable;


@end
