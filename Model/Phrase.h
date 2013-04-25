//
//  Phrase.h
//  KidsBookApp
//
//  Created by Peter Boerboom on 3/4/10.
//  Copyright 2010 ScrollMotion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoConstants.h"


@interface Phrase : NSObject <NSCoding> {
    NSString *text;
}


@property(nonatomic, readonly) NSString *text;


- (Phrase *)initWithDictionary:(NSDictionary *)phraseDict;


@end
