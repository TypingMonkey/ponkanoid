//
//  Paddle.m
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Paddle.h"


@implementation Paddle

@synthesize player;	
@synthesize velocity;
@synthesize targetY;

int const player1X = 50;
int const player2X = 974;
int const paddleVelocity = 1000;

int const marginY = 8; // screen margin on both sides (in order to be able to draw 10 blocks of 76 pix height each


- (id) initForPlayer:(int)playerNo {
    if (self = [super initWithFile:@"paddle.png"])
    {
        self.velocity = paddleVelocity;
        self.player = playerNo;
        if (playerNo == 1) {
            self.position = ccp(player1X, 300);
        } else
        { 
            self.position = ccp(player2X, 300);
        }
        self.targetY = self.position.y;
    }
    return self;
}

-(void)move:(ccTime)delta {
    CGPoint newLocation; // Will be used to check if paddle won't be placed beyond targetY, considering paddle speed  
    
    // Make sure paddle stays within screen boundaries
    if (targetY > 768 - marginY - ([self boundingBox].size.height / 2)) 
        targetY = 768 - marginY - ([self boundingBox].size.height / 2);
    if (targetY < ([self boundingBox].size.height / 2) + marginY) 
        targetY = ([self boundingBox].size.height / 2) + marginY;   
    // Move paddle down
    if (targetY > self.position.y) {
        newLocation = ccpAdd(self.position, ccpMult(ccp(0, paddleVelocity), delta));
        if (targetY < newLocation.y) self.position = ccp(self.position.x, targetY);
            else self.position = newLocation;
    }
    // Move paddle up
    if (targetY < self.position.y) {
        newLocation = ccpSub(self.position, ccpMult(ccp(0, paddleVelocity), delta));
        if (targetY > newLocation.y) self.position = ccp(self.position.x, targetY);
        else self.position = newLocation;
    }
    
    
    
}


@end
