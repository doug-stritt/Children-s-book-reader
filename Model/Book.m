//
//  Book.m
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import "Book.h"

static Book *sharedBook = nil;

@implementation Book

@synthesize currentPage;
@synthesize title;
@synthesize audioTracks;
@synthesize pages;
@synthesize bundledBookPath;


+ (Book *)sharedBook {
    if (sharedBook == nil) {
        sharedBook = [[super allocWithZone:NULL] init];
    }
    return sharedBook;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedBook] retain];
}

-(id)copyWithZone:(NSZone*)zone {
	return self;
}

-(id)retain {
	return self;
}

-(unsigned)retainCount {
	return UINT_MAX;
}

-(void)release {
	
}

-(id)autorelease {
	return self;
}


- (Book *)initWithBookPlist:(NSString *)bookPlist {
    // FIXME: ensure this initialization method is accounted for now that shared object pattern has been adopted
    assert(bookPlist);
    
    if ((self = [super init])) {    
        NSString *errorString = nil;
        NSPropertyListFormat format;
        NSDictionary *info = [NSPropertyListSerialization propertyListFromData:[NSData dataWithContentsOfFile:bookPlist]
                                                mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                          format:&format
                                                errorDescription:&errorString];
        
        // set title
        title = [[info objectForKey:KEY_BOOK_TITLE] retain];
        
        // init audio tracks
        audioTracks = [[NSMutableArray alloc] initWithCapacity:4];
        for (NSDictionary *track in [info objectForKey:KEY_BOOK_AUDIOTRACKS]) {
            [self addAudioTrackWithDisplayName:[track objectForKey:KEY_AUDIOTRACK_DISPLAYNAME] 
                                       trackID:[[track objectForKey:KEY_AUDIOTRACK_TRACKID] integerValue]
                                    editable:[[track objectForKey:KEY_AUDIOTRACK_ISEDITABLE] boolValue]];
        }
        
        // init pages
        NSMutableArray *tempPages = [[NSMutableArray alloc] initWithCapacity:[[info objectForKey:KEY_BOOK_PAGES] count]];
        for (NSDictionary *pageDict in [info objectForKey:KEY_BOOK_PAGES]){
            Page *page = [[Page alloc] initWithDictionary:pageDict];
            [tempPages addObject:page];
            [page release];
        }
        pages = [[NSArray alloc] initWithArray:tempPages];
        [tempPages release];
        
        // set bundled book path
        bundledBookPath = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"BundledBookPath"] copy];
    }
    
    return self;
}


- (void)dealloc {
    [title release];
    [audioTracks release];
    [pages release];
    [bundledBookPath release];
    [super dealloc];
}


- (void)addAudioTrackWithDisplayName:(NSString *)displayName trackID:(NSInteger)tid editable:(BOOL)editable {
    AudioTrack *audioTrack = [[AudioTrack alloc] initWithDisplayName:displayName trackID:tid editable:editable];
    [audioTracks addObject:audioTrack];
    [audioTrack release];
}


- (void)addAudioTrackWithDisplayName:(NSString *)displayName editable:(BOOL)editable {
    //FIXME: add auto unique id
    NSLog(@"Added audio track");
    [self addAudioTrackWithDisplayName:displayName
                               trackID:0 
                              editable:editable];
}


#pragma mark <NSCoding>

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        title = [[coder decodeObjectForKey:KEY_BOOK_TITLE] retain];
        audioTracks = [[coder decodeObjectForKey:KEY_BOOK_AUDIOTRACKS] retain];
        pages = [[coder decodeObjectForKey:KEY_BOOK_PAGES] retain];
        bundledBookPath = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"BundledBookPath"] copy];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:title forKey:KEY_BOOK_TITLE];
    [coder encodeObject:audioTracks forKey:KEY_BOOK_AUDIOTRACKS];
    [coder encodeObject:pages forKey:KEY_BOOK_PAGES];
}

@end
