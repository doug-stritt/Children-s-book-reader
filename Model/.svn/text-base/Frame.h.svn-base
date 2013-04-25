//
//  Frame.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoConstants.h"
#import "Phrase.h"


@interface Frame : NSObject <NSCoding> {
    NSInteger offsetX;
    NSInteger offsetY;
    float scale;
    Phrase *phrase;
}


@property(readonly) NSInteger offsetX;
@property(readonly) NSInteger offsetY;
@property(readonly) float scale;
@property(nonatomic, readonly) Phrase *phrase;


- (Frame *)initWithDictionary:(NSDictionary *)frameDict;


@end
