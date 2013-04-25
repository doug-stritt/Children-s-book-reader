//
//  AudioTrack.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "AudioTrack.h"


@implementation AudioTrack

@synthesize displayName;
@synthesize trackID;
@synthesize isEditable;


- (AudioTrack *)initWithDisplayName:(NSString *)name trackID:(NSUInteger)tid editable:(BOOL)editable {
    if ((self = [super init])) {
        displayName = [name copy];
        trackID = tid;
        isEditable = editable;
    }
    
    return self;
}

- (void)dealloc {
    [displayName release];
    [super dealloc];
}


#pragma mark <NSCoding>

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        displayName = [[coder decodeObjectForKey:KEY_AUDIOTRACK_DISPLAYNAME] retain];
        trackID = [coder decodeIntegerForKey:KEY_AUDIOTRACK_TRACKID];
        isEditable = [coder decodeBoolForKey:KEY_AUDIOTRACK_ISEDITABLE];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:displayName forKey:KEY_AUDIOTRACK_DISPLAYNAME];
    [coder encodeInteger:trackID forKey:KEY_AUDIOTRACK_TRACKID];
    [coder encodeBool:isEditable forKey:KEY_AUDIOTRACK_ISEDITABLE];
}

@end
