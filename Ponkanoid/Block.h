//
//  Block.h
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Block : CCSprite {
    
}

@property (nonatomic, readwrite) int row;
@property (nonatomic, readwrite) int index;

- (id) initWithRow:(int)row atIndex:(int)index; // max. ??? rows (lft to right), 10 positions in each row (top to bottom)
- (void) destroy;

@end
