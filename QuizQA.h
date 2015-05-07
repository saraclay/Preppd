//
//  QuizQA.h
//  Preppd
//
//  Created by ITP Student on 2/16/15.
//  Copyright (c) 2015 ITP Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCDictionary : NSObject

-(int) wordCount;
-(void) incCurrentIndex;
-(int) currentIndex;
-(NSString*) getNextWord;
-(NSString*) getFirstWord;
-(NSString*) getWordAtIndex:(int)index;
-(NSString*) getDefAtIndex:(int)index;
-(NSString*) getHintAtIndex:(int)index;


@end