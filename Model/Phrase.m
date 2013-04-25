//
//  Phrase.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "Phrase.h"


@implementation Phrase

@synthesize text;


- (Phrase *)initWithDictionary:(NSDictionary *)phraseDict {
    
    assert(phraseDict);
    
    if ((self = [super init])) {
        text = [[phraseDict objectForKey:KEY_PHRASE_TEXT] retain];
    }
    
    return self;
}


- (void)dealloc {
    [text release];
    [super dealloc];
}


#pragma mark <NSCoding>

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        text = [[coder decodeObjectForKey:KEY_PHRASE_TEXT] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:text forKey:KEY_PHRASE_TEXT];
}

@end
