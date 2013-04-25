//
//  Page.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "Page.h"


@implementation Page

@synthesize imageFileName;
@synthesize hasAuxiliaryContent;
@synthesize auxiliaryContentURL;
@synthesize frames;


- (Page *)initWithDictionary:(NSDictionary *)pageDict {
    
    assert(pageDict);
    
    if ((self = [super init])) {
        imageFileName = [[pageDict objectForKey:KEY_PAGE_IMAGEFILENAME] retain];
        
        hasAuxiliaryContent = [[pageDict objectForKey:KEY_PAGE_HASAUXCONTENT] boolValue];
        
        if (hasAuxiliaryContent) {
            auxiliaryContentURL = [[pageDict objectForKey:KEY_PAGE_AUXCONTENTURL] retain];
        } else {
            auxiliaryContentURL = nil;
        }
        
        NSMutableArray *tempFrames = [[NSMutableArray alloc] initWithCapacity:[[pageDict objectForKey:KEY_PAGE_FRAMES] count]];
        for (NSDictionary *frameDict in [pageDict objectForKey:KEY_PAGE_FRAMES]) {
            Frame *frame = [[Frame alloc] initWithDictionary:frameDict];
            [tempFrames addObject:frame];
            [frame release];
        }
        frames = [[NSArray alloc] initWithArray:tempFrames];
        [tempFrames release];
        
    }
    
    return self;
}


- (void)dealloc {
    [imageFileName release];
    [auxiliaryContentURL release];
    [frames release];
    [super dealloc];
}


#pragma mark <NSCoding>

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        imageFileName = [[coder decodeObjectForKey:KEY_PAGE_IMAGEFILENAME] retain];
        hasAuxiliaryContent = [coder decodeBoolForKey:KEY_PAGE_HASAUXCONTENT];
        auxiliaryContentURL = [[coder decodeObjectForKey:KEY_PAGE_AUXCONTENTURL] retain];
        frames = [[coder decodeObjectForKey:KEY_PAGE_FRAMES] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:imageFileName forKey:KEY_PAGE_IMAGEFILENAME];
    [coder encodeBool:hasAuxiliaryContent forKey:KEY_PAGE_HASAUXCONTENT];
    [coder encodeObject:auxiliaryContentURL forKey:KEY_PAGE_AUXCONTENTURL];
    [coder encodeObject:frames forKey:KEY_PAGE_FRAMES];
}

@end
