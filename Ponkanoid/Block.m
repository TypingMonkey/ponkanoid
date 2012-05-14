//
//  Block.m
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Block.h"
#import "Paddle.h"

@implementation Block

@synthesize row = _row;
@synthesize index = _index;

static int marginX = 400;

- (id) initWithRow:(int)row atIndex:(int)index {

    // TODO: fix something to create different blocks (code below makes sure block colours alternate
    NSString * sprite;   
    if (row % 2 == 1) sprite = @"block1.png"; else sprite = @"block2.png";
    
    if (self = [super initWithFile:sprite])
    {
        _row = row;
        _index = index;
        int x = marginX + [self boundingBox].size.width * _row;
        int y = marginY + ([self boundingBox].size.height * _index) + ([self boundingBox].size.height / 2);
        NSLog(@"X: %i, Y: %i, index: %i", x, y, _index);
        self.position = ccp(x, y);
        
    }
    return self; 
}

- (void) destroy {
    
}


@end
