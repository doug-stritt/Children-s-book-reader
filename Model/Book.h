//
//  Book.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/3/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoConstants.h"
#import "AudioTrack.h"
#import "Page.h"


@interface Book : NSObject <NSCoding> {
    NSUInteger currentPage;
    NSString *title;
    NSMutableArray *audioTracks;
    NSArray *pages;
    NSString *bundledBookPath;
}


@property NSUInteger currentPage;
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSMutableArray *audioTracks;
@property(nonatomic, readonly) NSArray *pages;
@property(nonatomic, readonly) NSString *bundledBookPath;


+ (Book *)sharedBook;
- (Book *)initWithBookPlist:(NSString *)bookPlist;

- (void)addAudioTrackWithDisplayName:(NSString *)displayName trackID:(NSInteger)tid editable:(BOOL)editable;
- (void)addAudioTrackWithDisplayName:(NSString *)displayName editable:(BOOL)editable;


@end
