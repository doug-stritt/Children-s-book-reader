//
//  Frame.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "Frame.h"


@implementation Frame

@synthesize offsetX;
@synthesize offsetY;
@synthesize scale;
@synthesize phrase;


- (Frame *)initWithDictionary:(NSDictionary *)frameDict {
    
    assert(frameDict);
    
    if ((self = [super init])) {
        offsetX = [[frameDict objectForKey:KEY_FRAME_OFFSETX] integerValue];
        offsetY = [[frameDict objectForKey:KEY_FRAME_OFFSETY] integerValue];
        scale = [[frameDict objectForKey:KEY_FRAME_SCALE] floatValue];
        phrase = [[Phrase alloc] initWithDictionary:[frameDict objectForKey:KEY_FRAME_PHRASE]];
    }
    
    return self;
}


- (void)dealloc {
    [phrase release];
    [super dealloc];
}


#pragma mark <NSCoding>

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        offsetX = [coder decodeIntegerForKey:KEY_FRAME_OFFSETX];
        offsetY = [coder decodeIntegerForKey:KEY_FRAME_OFFSETY];
        scale = [coder decodeFloatForKey:KEY_FRAME_SCALE];
        phrase = [[coder decodeObjectForKey:KEY_FRAME_PHRASE] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:offsetX forKey:KEY_FRAME_OFFSETX];
    [coder encodeInteger:offsetY forKey:KEY_FRAME_OFFSETY];
    [coder encodeFloat:scale forKey:KEY_FRAME_SCALE];
    [coder encodeObject:phrase forKey:KEY_FRAME_PHRASE];
}

@end
